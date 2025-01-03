package reservation

import (
	"context"
	"time"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"

	"github.com/google/uuid"
)

func (s *Service) UpsertReservation(ctx context.Context, req *proto.UpsertReservationRequest) (*proto.UpsertReservationResponse, error) {
	db, err := s.repository.Db(ctx)
	if err != nil {
		return nil, err
	}
	var reservationID uuid.UUID
	if req.ReservationId != "" {
		reservationID = uuid.MustParse(req.ReservationId)
	}
	reservedUntil := time.Now().Add(15 * time.Minute)
	_, err = s.repository.UpsertReservation(db, model.Reservation{
		ID:            reservationID,
		UserID:        "TODO userID",
		StartAt:       time.Unix(req.StartAtUnix, 0),
		EndAt:         time.Unix(req.EndAtUnix, 0),
		ResourceID:    uuid.MustParse(req.ResourceId),
		ReservedUntil: &reservedUntil,
	})
	return &proto.UpsertReservationResponse{
		ReservationId:     reservationID.String(),
		ReservedUntilUnix: reservedUntil.Unix(),
	}, err
}
