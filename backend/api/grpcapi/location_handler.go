package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type LocationService interface {
	UpsertLocation(ctx context.Context, req *proto.UpsertLocationRequest) (*proto.UpsertLocationResponse, error)
}

type LocationHandler struct {
	locationService LocationService
	proto.UnimplementedLocationServiceServer
}

func NewLocationHandler(locationService LocationService) *LocationHandler {
	return &LocationHandler{
		locationService: locationService,
	}
}

func (h *LocationHandler) UpsertLocation(ctx context.Context, req *proto.UpsertLocationRequest) (*proto.UpsertLocationResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.locationService.UpsertLocation(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}
