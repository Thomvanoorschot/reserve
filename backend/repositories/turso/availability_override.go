package turso

import (
	"reserve/generated/jet_gen/model"
	. "reserve/generated/jet_gen/table"
	"reserve/services"

	. "github.com/go-jet/jet/v2/sqlite"
)

func (r *Repository) UpsertAvailabilityOverride(
	db services.QueryExecutor,
	m model.ResourceAvailabilityOverride,
) error {
	sql, args := ResourceAvailabilityOverride.
		INSERT(
			ResourceAvailabilityOverride.ID,
			ResourceAvailabilityOverride.ResourceID,
			ResourceAvailabilityOverride.AvailabilityID,
			ResourceAvailabilityOverride.Name,
			ResourceAvailabilityOverride.StartAt,
			ResourceAvailabilityOverride.EndAt,
		).
		ON_CONFLICT(ResourceAvailabilityOverride.ID).
		DO_UPDATE(
			SET(
				ResourceAvailabilityOverride.Name.SET(ResourceAvailabilityOverride.EXCLUDED.Name),
				ResourceAvailabilityOverride.StartAt.SET(ResourceAvailabilityOverride.EXCLUDED.StartAt),
				ResourceAvailabilityOverride.EndAt.SET(ResourceAvailabilityOverride.EXCLUDED.EndAt),
			),
		).
		MODEL(m).
		Sql()

	_, err := db.Exec(sql, args...)
	return err
}
