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

	b := availability.RangesToBits(req.AvailabilityRanges)
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

	_, err = s.repository.UpsertLocation(tx, model.Location{
		ID:                    locationID,
		Name:                  req.Name,
		DefaultAvailabilityID: &availabilityID,
		Tz:                    req.Tz,
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
