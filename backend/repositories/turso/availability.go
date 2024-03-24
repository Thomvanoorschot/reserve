package turso

import (
	"context"
	"time"

	. "reserve/generated/jet_gen/table"
	"reserve/services/availability"

	. "github.com/go-jet/jet/v2/sqlite"
	"github.com/google/uuid"
)

func (r *Repository) GetAvailabilityRequirements(
	ctx context.Context,
	locationID uuid.UUID,
	startAt, endAt time.Time,
) (resp availability.Requirements, err error) {
	db, err := r.Db(ctx)
	if err != nil {
		return resp, err
	}

	sql, args := SELECT(
		Location.ID,
		Location.Tz,
		Resource.ID,
		Resource.MinimumSegments,
		Resource.MaximumSegments,
		Resource.AllowInvalidSegments,
		Availability.ID,
		Availability.PartOne,
		Availability.PartTwo,
		Availability.PartThree,
		Availability.PartFour,
		Availability.PartFive,
		Availability.PartSix,
		ResourceAvailabilityOverride.StartAt,
		ResourceAvailabilityOverride.EndAt,
	).
		FROM(Location.
			INNER_JOIN(Resource, Resource.LocationID.EQ(Location.ID)).
			LEFT_JOIN(ResourceAvailabilityOverride, ResourceAvailabilityOverride.ResourceID.EQ(Resource.ID).
				AND(ResourceAvailabilityOverride.StartAt.LT_EQ(JetTimestamp(endAt))).
				AND(ResourceAvailabilityOverride.EndAt.GT_EQ(JetTimestamp(startAt)))).
			INNER_JOIN(Availability, Availability.ID.EQ(Resource.DefaultAvailabilityID).OR(Availability.ID.EQ(ResourceAvailabilityOverride.AvailabilityID))),
		).
		ORDER_BY(Resource.ID, ResourceAvailabilityOverride.StartAt.ASC()).
		Sql()

	rows, _ := db.Query(sql, args...)

	for rows.Next() {
		var (
			id                    uuid.UUID
			tz                    string
			resourceID            uuid.UUID
			minimumSegments       int32
			maximumSegments       int32
			allowInvalidSegments  bool
			availabilityID        uuid.UUID
			availabilityPartOne   uint64
			availabilityPartTwo   uint64
			availabilityPartThree uint64
			availabilityPartFour  uint64
			availabilityPartFive  uint64
			availabilityPartSix   uint64
			aStartAt              *time.Time
			aEndAt                *time.Time
		)
		err = rows.Scan(
			&id,
			&tz,
			&resourceID,
			&minimumSegments,
			&maximumSegments,
			&allowInvalidSegments,
			&availabilityID,
			&availabilityPartOne,
			&availabilityPartTwo,
			&availabilityPartThree,
			&availabilityPartFour,
			&availabilityPartFive,
			&availabilityPartSix,
			&aStartAt,
			&aEndAt,
		)
		if resp.LocationID != id {
			resp.LocationID = id
			resp.MinimumSegments = minimumSegments
			resp.MaximumSegments = maximumSegments
			resp.AllowInvalidSegments = allowInvalidSegments
			resp.TZ = tz
		}

		if len(resp.Resources) == 0 || resp.Resources[len(resp.Resources)-1].ID != resourceID {
			resp.Resources = append(resp.Resources, availability.Resource{
				ID:           resourceID,
				Availability: nil,
			})
		}
		if len(resp.Resources) == 0 {
			continue
		}
		if len(resp.Resources[len(resp.Resources)-1].Availability) == 0 ||
			resp.Resources[len(resp.Resources)-1].
				Availability[len(resp.Resources[len(resp.Resources)-1].
				Availability)-1].ID != availabilityID {
			resp.Resources[len(resp.Resources)-1].Availability = append(resp.Resources[len(resp.Resources)-1].Availability, availability.Availability{
				ID:        availabilityID,
				PartOne:   availabilityPartOne,
				PartTwo:   availabilityPartTwo,
				PartThree: availabilityPartThree,
				PartFour:  availabilityPartFour,
				PartFive:  availabilityPartFive,
				PartSix:   availabilityPartSix,
				StartAt:   aStartAt,
				EndAt:     aEndAt,
			})
		}
		if err != nil {
			return resp, err
		}
	}
	return resp, nil
}
