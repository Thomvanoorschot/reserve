package location

import (
	"context"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"
	"reserve/services"
	"reserve/services/availability"

	"github.com/google/uuid"
)

func (s *Service) UpsertLocation(ctx context.Context, req *proto.UpsertLocationRequest) (resp *proto.UpsertLocationResponse, err error) {
	tx, err := s.repository.Tx(ctx)
	if err != nil {
		return nil, err
	}
	defer func(tx services.TxQueryExecutor) {
		err = tx.Rollback()
	}(tx)

	var locationID uuid.UUID
	if req.Id != "" {
		locationID = uuid.MustParse(req.Id)
	} else {
		locationID = uuid.New()
	}

	availabilityIDs := [7]uuid.UUID{}
	for i, r := range [][]*proto.AvailabilityRange{
		req.DefaultMondayAvailability,
		req.DefaultTuesdayAvailability,
		req.DefaultWednesdayAvailability,
		req.DefaultThursdayAvailability,
		req.DefaultFridayAvailability,
		req.DefaultSaturdayAvailability,
		req.DefaultSundayAvailability,
	} {
		b := availability.RangesToBits(r)
		availabilityID, err := s.repository.UpsertAvailability(tx, model.Availability{
			ID:        uuid.New(),
			PartOne:   b.PartOne,
			PartTwo:   b.PartTwo,
			PartThree: b.PartThree,
			PartFour:  b.PartFour,
			PartFive:  b.PartFive,
			PartSix:   b.PartSix,
		})
		if err != nil {
			return nil, err
		}
		availabilityIDs[i] = availabilityID
	}
	_, err = s.repository.UpsertLocation(tx, model.Location{
		ID:                             locationID,
		Name:                           req.Name,
		DefaultMondayAvailabilityID:    &availabilityIDs[0],
		DefaultTuesdayAvailabilityID:   &availabilityIDs[0],
		DefaultWednesdayAvailabilityID: &availabilityIDs[0],
		DefaultThursdayAvailabilityID:  &availabilityIDs[0],
		DefaultFridayAvailabilityID:    &availabilityIDs[0],
		DefaultSaturdayAvailabilityID:  &availabilityIDs[0],
		DefaultSundayAvailabilityID:    &availabilityIDs[0],
		Tz:                             req.Tz,
	})
	if err != nil {
		return nil, err
	}

	err = tx.Commit()
	if err != nil {
		return nil, err
	}
	return &proto.UpsertLocationResponse{Id: locationID.String()}, nil
}
