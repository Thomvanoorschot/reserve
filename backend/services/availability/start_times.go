package availability

import (
	"context"

	"reserve/generated/proto"

	"github.com/google/uuid"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func (s *Service) GetStartTimes(ctx context.Context, req *proto.GetStartTimesRequest) (*proto.GetStartTimesResponse, error) {
	startAt := req.StartAt.AsTime()
	endAt := req.EndAt.AsTime()
	requirements, err := s.repository.GetAvailabilityRequirements(ctx, uuid.MustParse(req.LocationId), startAt, endAt)
	if err != nil {
		return nil, err
	}

	slotStarts := GetTimeSlotStarts(startAt, endAt, requirements, map[int64][]Reservation{})

	protoStartTimes := make([]*timestamppb.Timestamp, len(slotStarts))
	for i, start := range slotStarts {
		protoStartTimes[i] = timestamppb.New(start)
	}
	return &proto.GetStartTimesResponse{
		StartTimes: protoStartTimes,
	}, nil
}
