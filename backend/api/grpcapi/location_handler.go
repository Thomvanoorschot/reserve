package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"connectrpc.com/connect"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type LocationService interface {
	GetLocationByID(ctx context.Context, req *proto.GetLocationByIDRequest) (resp *proto.LocationResponse, err error)
	GetLocations(ctx context.Context, req *proto.GetLocationsRequest) (*proto.GetLocationsResponse, error)
	UpsertLocation(ctx context.Context, req *proto.UpsertLocationRequest) (*proto.UpsertLocationResponse, error)
}

type LocationHandler struct {
	locationService LocationService
}

func NewLocationHandler(locationService LocationService) *LocationHandler {
	return &LocationHandler{
		locationService: locationService,
	}
}

func (h *LocationHandler) GetLocationByID(
	ctx context.Context,
	req *connect.Request[proto.GetLocationByIDRequest],
) (*connect.Response[proto.LocationResponse], error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.locationService.GetLocationByID(ctx, req.Msg)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return connect.NewResponse(resp), nil
}

func (h *LocationHandler) GetLocations(
	ctx context.Context,
	req *connect.Request[proto.GetLocationsRequest],
) (*connect.Response[proto.GetLocationsResponse], error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.locationService.GetLocations(ctx, req.Msg)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return connect.NewResponse(resp), nil
}

func (h *LocationHandler) UpsertLocation(
	ctx context.Context,
	req *connect.Request[proto.UpsertLocationRequest],
) (*connect.Response[proto.UpsertLocationResponse], error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.locationService.UpsertLocation(ctx, req.Msg)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return connect.NewResponse(resp), nil
}
