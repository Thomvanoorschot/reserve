package turso

import (
	"reserve/generated/jet_gen/model"
	. "reserve/generated/jet_gen/table"
	"reserve/services"
	"reserve/services/availability"
	"reserve/services/location"

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

func (r *Repository) GetLocations(db services.QueryExecutor) (resp []location.Model, err error) {
	sql, args := SELECT(
		Location.ID,
		Location.Name,
		Location.Tz,
	).
		FROM(Location).
		Sql()

	rows, _ := db.Query(sql, args...)

	for rows.Next() {
		var (
			id   uuid.UUID
			name string
			tz   string
		)
		err = rows.Scan(
			&id,
			&name,
			&tz,
		)
		if len(resp) == 0 || resp[len(resp)-1].ID != id {
			resp = append(resp, location.Model{
				ID:   id,
				TZ:   tz,
				Name: name,
			})
		}
		if len(resp) == 0 {
			return resp, nil
		}
	}
	return resp, nil
}
func (r *Repository) GetLocationByID(db services.QueryExecutor, id uuid.UUID) (resp location.Model, err error) {
	sql, args := SELECT(
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
		Availability.ID,
		Availability.PartOne,
		Availability.PartTwo,
		Availability.PartThree,
		Availability.PartFour,
		Availability.PartFive,
		Availability.PartSix,
	).
		FROM(Location.
			INNER_JOIN(Availability, Availability.ID.IN(
				Location.DefaultMondayAvailabilityID,
				Location.DefaultTuesdayAvailabilityID,
				Location.DefaultWednesdayAvailabilityID,
				Location.DefaultThursdayAvailabilityID,
				Location.DefaultFridayAvailabilityID,
				Location.DefaultSaturdayAvailabilityID,
				Location.DefaultSundayAvailabilityID,
			),
			),
		).
		WHERE(Location.ID.EQ(UUID(id))).
		Sql()

	rows, _ := db.Query(sql, args...)

	for rows.Next() {
		var (
			locId                          uuid.UUID
			name                           string
			tz                             string
			defaultMondayAvailabilityID    uuid.UUID
			defaultTuesdayAvailabilityID   uuid.UUID
			defaultWednesdayAvailabilityID uuid.UUID
			defaultThursdayAvailabilityID  uuid.UUID
			defaultFridayAvailabilityID    uuid.UUID
			defaultSaturdayAvailabilityID  uuid.UUID
			defaultSundayAvailabilityID    uuid.UUID
			availabilityID                 uuid.UUID
			availabilityPartOne            uint64
			availabilityPartTwo            uint64
			availabilityPartThree          uint64
			availabilityPartFour           uint64
			availabilityPartFive           uint64
			availabilityPartSix            uint64
		)
		err = rows.Scan(
			&locId,
			&name,
			&tz,
			&defaultMondayAvailabilityID,
			&defaultTuesdayAvailabilityID,
			&defaultWednesdayAvailabilityID,
			&defaultThursdayAvailabilityID,
			&defaultFridayAvailabilityID,
			&defaultSaturdayAvailabilityID,
			&defaultSundayAvailabilityID,
			&availabilityID,
			&availabilityPartOne,
			&availabilityPartTwo,
			&availabilityPartThree,
			&availabilityPartFour,
			&availabilityPartFive,
			&availabilityPartSix,
		)

		resp.ID = locId
		resp.TZ = tz
		resp.Name = name
		la := location.Availability{
			ID: availabilityID,
			Bits: availability.Bits{
				PartOne:   availabilityPartOne,
				PartTwo:   availabilityPartTwo,
				PartThree: availabilityPartThree,
				PartFour:  availabilityPartFour,
				PartFive:  availabilityPartFive,
				PartSix:   availabilityPartSix,
			},
		}
		if availabilityID == defaultMondayAvailabilityID {
			resp.DefaultMondayAvailability = la
		} else if availabilityID == defaultTuesdayAvailabilityID {
			resp.DefaultTuesdayAvailability = la
		} else if availabilityID == defaultWednesdayAvailabilityID {
			resp.DefaultWednesdayAvailability = la
		} else if availabilityID == defaultThursdayAvailabilityID {
			resp.DefaultThursdayAvailability = la
		} else if availabilityID == defaultFridayAvailabilityID {
			resp.DefaultFridayAvailability = la
		} else if availabilityID == defaultSaturdayAvailabilityID {
			resp.DefaultSaturdayAvailability = la
		} else if availabilityID == defaultSundayAvailabilityID {
			resp.DefaultSundayAvailability = la
		}
	}
	return resp, nil
}
