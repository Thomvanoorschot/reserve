package turso

import (
	"reserve/generated/jet_gen/model"
	. "reserve/generated/jet_gen/table"
	"reserve/services"

	. "github.com/go-jet/jet/v2/sqlite"
	"github.com/google/uuid"
)

func (r *Repository) UpsertReservation(db services.QueryExecutor, m model.Reservation) (resp uuid.UUID, err error) {
	sql, args := Reservation.
		INSERT(
			Reservation.ID,
			Reservation.UserID,
			Reservation.StartAt,
			Reservation.EndAt,
			Reservation.ResourceID,
			Reservation.ReservedUntil,
		).
		ON_CONFLICT(Availability.ID).
		DO_UPDATE(
			SET(
				Reservation.ID.SET(Reservation.EXCLUDED.ID),
				Reservation.UserID.SET(Reservation.EXCLUDED.UserID),
				Reservation.StartAt.SET(Reservation.EXCLUDED.StartAt),
				Reservation.EndAt.SET(Reservation.EXCLUDED.EndAt),
				Reservation.ResourceID.SET(Reservation.EXCLUDED.ResourceID),
				Reservation.ReservedUntil.SET(Reservation.EXCLUDED.ReservedUntil),
			),
		).
		MODEL(m).
		RETURNING(Reservation.ID).
		Sql()

	row := db.QueryRow(sql, args...)

	if row.Err() != nil {
		return resp, row.Err()
	}
	err = row.Scan(&resp)
	if err != nil {
		return resp, err
	}
	return resp, nil
}
