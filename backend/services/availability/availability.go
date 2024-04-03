package availability

import (
	"context"
	"time"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"
	"reserve/services"

	"github.com/google/uuid"
)

func (s *Service) UpdateLocationDefaultAvailability(
	ctx context.Context,
	req *proto.UpdateLocationDefaultAvailabilityRequest,
) (*proto.UpdateLocationDefaultAvailabilityResponse, error) {
	tx, err := s.repository.Tx(ctx)
	defer func(tx services.TxQueryExecutor) {
		err = tx.Rollback()
	}(tx)

	if err != nil {
		return nil, err
	}
	b := RangesToBits(req.AvailabilityRanges)
	_, err = s.repository.UpsertAvailability(tx, model.Availability{
		ID:        uuid.MustParse(req.AvailabilityId),
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

	err = tx.Commit()
	return nil, err
}

func (s *Service) GetAvailableDays(ctx context.Context, req *proto.GetAvailableDaysRequest) (*proto.GetAvailableDaysResponse, error) {
	startAt := time.Unix(req.StartAtUnix, 0)
	endAt := time.Unix(req.EndAtUnix, 0)

	db, err := s.repository.Db(ctx)
	if err != nil {
		return nil, err
	}
	requirements, err := s.repository.GetAvailabilityRequirements(db, uuid.MustParse(req.LocationId), startAt, endAt)
	if err != nil {
		return nil, err
	}

	availableDays := GetAvailableDays(startAt, endAt, requirements, map[int64][]Reservation{})

	availableDaysUnix := make([]int64, len(availableDays))
	for i, start := range availableDays {
		availableDaysUnix[i] = start.Unix()
	}
	return &proto.GetAvailableDaysResponse{
		AvailableDaysUnix: availableDaysUnix,
		Tz:                requirements.TZ,
	}, nil
}

func (s *Service) GetAvailableTimeslots(ctx context.Context, req *proto.GetAvailableTimeslotsRequest) (*proto.GetAvailableTimeslotsResponse, error) {
	dayUnix := time.Unix(req.DayUnix, 0)
	endAt := dayUnix.Add(24 * time.Hour)

	db, err := s.repository.Db(ctx)
	if err != nil {
		return nil, err
	}
	requirements, err := s.repository.GetAvailabilityRequirements(db, uuid.MustParse(req.LocationId), dayUnix, endAt)
	if err != nil {
		return nil, err
	}

	timeslots := GetAvailableTimeslots(dayUnix, endAt, requirements, map[int64][]Reservation{})

	protoStartTimes := make([]int64, len(timeslots))
	for i, start := range timeslots {
		protoStartTimes[i] = start.Unix()
	}
	return &proto.GetAvailableTimeslotsResponse{
		StartTimesUnix: protoStartTimes,
		Tz:             requirements.TZ,
	}, nil
}
