package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type AvailabilityService interface {
	GetAvailableDays(ctx context.Context, req *proto.GetAvailableDaysRequest) (*proto.GetAvailableDaysResponse, error)
	GetAvailableTimeslots(ctx context.Context, req *proto.GetAvailableTimeslotsRequest) (*proto.GetAvailableTimeslotsResponse, error)
	UpsertAvailabilityOverride(ctx context.Context, req *proto.UpsertAvailabilityOverrideRequest) (*proto.UpsertAvailabilityOverrideResponse, error)
	//UpsertResource(ctx context.Context, req *proto.UpsertResourceRequest) (*proto.UpsertResourceResponse, error)
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

func (h *AvailabilityHandler) GetAvailableDays(ctx context.Context, req *proto.GetAvailableDaysRequest) (*proto.GetAvailableDaysResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.availabilityService.GetAvailableDays(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}

func (h *AvailabilityHandler) GetAvailableTimeslots(ctx context.Context, req *proto.GetAvailableTimeslotsRequest) (*proto.GetAvailableTimeslotsResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.availabilityService.GetAvailableTimeslots(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}

func (h *AvailabilityHandler) UpsertAvailabilityOverride(ctx context.Context, req *proto.UpsertAvailabilityOverrideRequest) (*proto.UpsertAvailabilityOverrideResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.availabilityService.UpsertAvailabilityOverride(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}
