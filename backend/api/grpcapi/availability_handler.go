package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type AvailabilityService interface {
	UpsertAvailability(ctx context.Context) (*proto.UpsertAvailabilityResponse, error)
}

type AvailabilityHandler struct {
	availabilityService AvailabilityService
	proto.UnimplementedAvailabilityServiceServer
}

func NewAvailabilityHandler(availabilityService AvailabilityService) *AvailabilityHandler {
	return &AvailabilityHandler{
		availabilityService: availabilityService,
	}
}

func (h *AvailabilityHandler) UpsertAvailability(ctx context.Context, req *proto.UpsertAvailabilityRequest) (*proto.UpsertAvailabilityResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.availabilityService.UpsertAvailability(ctx)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}
