package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type ReservationService interface {
	UpsertReservation(ctx context.Context, req *proto.UpsertReservationRequest) (*proto.UpsertReservationResponse, error)
}

type ReservationHandler struct {
	reservationService ReservationService
	proto.UnimplementedReservationServiceServer
}

func NewReservationHandler(reservationService ReservationService) *ReservationHandler {
	return &ReservationHandler{
		reservationService: reservationService,
	}
}

func (h *ReservationHandler) UpsertReservation(ctx context.Context, req *proto.UpsertReservationRequest) (*proto.UpsertReservationResponse, error) {
	if req == nil {
		return nil, status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	resp, err := h.reservationService.UpsertReservation(ctx, req)
	if err != nil {
		return nil, status.Error(
			codes.Unknown, err.Error(),
		)
	}

	return resp, nil
}
