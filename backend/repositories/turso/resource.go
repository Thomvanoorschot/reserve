package turso

import (
	"reserve/generated/jet_gen/model"
	. "reserve/generated/jet_gen/table"

	. "github.com/go-jet/jet/v2/sqlite"
)

func (r *Repository) UpsertResource(tenant string, m model.Resource) error {
	db, err := r.Db(tenant)
	if err != nil {
		return err
	}

	sql, args := Resource.
		INSERT(Resource.AllColumns).
		ON_CONFLICT(Resource.ID).
		DO_UPDATE(
			SET(
				Resource.Name.SET(Resource.EXCLUDED.Name),
				Resource.DefaultAvailability1.SET(Resource.EXCLUDED.DefaultAvailability1),
				Resource.DefaultAvailability2.SET(Resource.EXCLUDED.DefaultAvailability2),
			),
		).
		MODEL(m).
		Sql()

	_, err = db.Exec(sql, args...)
	return err
}
