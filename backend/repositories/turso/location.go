package turso

import (
	"reserve/generated/jet_gen/model"
	. "reserve/generated/jet_gen/table"
	"reserve/services"

	. "github.com/go-jet/jet/v2/sqlite"
	"github.com/google/uuid"
)

func (r *Repository) UpsertLocation(db services.QueryExecutor, m model.Location) (resp uuid.UUID, err error) {
	sql, args := Location.
		INSERT(
			Location.ID,
			Location.Name,
			Location.Tz,
			Location.DefaultMondayAvailabilityID,
			Location.DefaultTuesdayAvailabilityID,
			Location.DefaultWednesdayAvailabilityID,
			Location.DefaultThursdayAvailabilityID,
			Location.DefaultFridayAvailabilityID,
			Location.DefaultSaturdayAvailabilityID,
			Location.DefaultSundayAvailabilityID,
		).
		ON_CONFLICT(Location.ID).
		DO_UPDATE(
			SET(
				Location.Name.SET(Location.EXCLUDED.Name),
				Location.Tz.SET(Location.EXCLUDED.Tz),
			),
		).
		MODEL(m).
		RETURNING(Location.ID).
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
