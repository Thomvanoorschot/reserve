package availability

import (
	"context"
	"fmt"

	"reserve/generated/proto"
)

func (s *Service) UpsertAvailabilityOverride(ctx context.Context, req *proto.UpsertAvailabilityOverrideRequest) (*proto.UpsertAvailabilityOverrideResponse, error) {

	b := RangesToBits(req.AvailabilityRanges)

	fmt.Print(b)
	return nil, nil
}
