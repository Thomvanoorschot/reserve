package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type AvailabilityService interface {
	GetStartTimes(ctx context.Context, req *proto.GetStartTimesRequest) (*proto.GetStartTimesResponse, error)
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

func (h *AvailabilityHandler) GetStartTimes(ctx context.Context, req *proto.GetStartTimesRequest) (*proto.GetStartTimesResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.availabilityService.GetStartTimes(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}

//func (h *AvailabilityHandler) UpsertResource(ctx context.Context, req *proto.UpsertResourceRequest) (*proto.UpsertResourceResponse, error) {
//	if req == nil {
//		return nil, status.Error(
//			codes.InvalidArgument, "no request found",
//		)
//	}
//
//	resp, err := h.availabilityService.UpsertResource(ctx, req)
//	if err != nil {
//		return nil, status.Error(
//			codes.Unknown, err.Error(),
//		)
//	}
//
//	return resp, nil
//}
