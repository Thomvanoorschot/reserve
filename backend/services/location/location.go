package location

import (
	"context"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"
	"reserve/services"
	"reserve/services/availability"

	"github.com/google/uuid"
)

func (s *Service) GetLocationByID(ctx context.Context, req *proto.GetLocationByIDRequest) (resp *proto.LocationResponse, err error) {
	db, err := s.repository.Db(ctx)
	if err != nil {
		return nil, err
	}
	loc, err := s.repository.GetLocationByID(db, uuid.MustParse(req.Id))
	if err != nil {
		return nil, err
	}

	return &proto.LocationResponse{
		Id:                           loc.ID.String(),
		Name:                         loc.Name,
		Tz:                           loc.TZ,
		DefaultMondayAvailability:    availability.BitsToRanges(loc.DefaultMondayAvailability.Bits),
		DefaultTuesdayAvailability:   availability.BitsToRanges(loc.DefaultTuesdayAvailability.Bits),
		DefaultWednesdayAvailability: availability.BitsToRanges(loc.DefaultWednesdayAvailability.Bits),
		DefaultThursdayAvailability:  availability.BitsToRanges(loc.DefaultThursdayAvailability.Bits),
		DefaultFridayAvailability:    availability.BitsToRanges(loc.DefaultFridayAvailability.Bits),
		DefaultSaturdayAvailability:  availability.BitsToRanges(loc.DefaultSaturdayAvailability.Bits),
		DefaultSundayAvailability:    availability.BitsToRanges(loc.DefaultSundayAvailability.Bits),
	}, nil
}
func (s *Service) GetLocations(ctx context.Context, req *proto.GetLocationsRequest) (resp *proto.GetLocationsResponse, err error) {
	db, err := s.repository.Db(ctx)
	if err != nil {
		return nil, err
	}
	locations, err := s.repository.GetLocations(db)
	if err != nil {
		return nil, err
	}
	if len(locations) == 0 {
		return nil, nil

	}
	resp = &proto.GetLocationsResponse{}
	for _, loc := range locations {
		resp.Locations = append(resp.Locations, &proto.LocationResponse{
			Id:   loc.ID.String(),
			Name: loc.Name,
			Tz:   loc.TZ,
		})
	}

	return resp, nil
}

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
		DefaultTuesdayAvailabilityID:   &availabilityIDs[1],
		DefaultWednesdayAvailabilityID: &availabilityIDs[2],
		DefaultThursdayAvailabilityID:  &availabilityIDs[3],
		DefaultFridayAvailabilityID:    &availabilityIDs[4],
		DefaultSaturdayAvailabilityID:  &availabilityIDs[5],
		DefaultSundayAvailabilityID:    &availabilityIDs[6],
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
