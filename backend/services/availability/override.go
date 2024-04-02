package availability

import (
	"context"
	"time"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"
	"reserve/services"

	"github.com/google/uuid"
)

func (s *Service) UpsertAvailabilityOverride(ctx context.Context, req *proto.UpsertAvailabilityOverrideRequest) (resp *proto.UpsertAvailabilityOverrideResponse, err error) {
	tx, err := s.repository.Tx(ctx)
	defer func(tx services.TxQueryExecutor) {
		err = tx.Rollback()
	}(tx)

	if err != nil {
		return nil, err
	}
	var availabilityId uuid.UUID
	if req.AvailabilityId == "" {
		b := RangesToBits(req.AvailabilityRanges)
		newAvailabilityId, err := s.repository.UpsertAvailability(tx, model.Availability{
			ID:        uuid.New(),
			PartOne:   b.PartOne,
			PartTwo:   b.PartTwo,
			PartThree: b.PartThree,
			PartFour:  b.PartFour,
			PartFive:  b.PartFive,
			PartSix:   b.PartSix,
		})
		if err != nil {
			return nil, err
		}
		availabilityId = newAvailabilityId
	} else {
		availabilityId = uuid.MustParse(req.AvailabilityId)
	}
	var overrideName *string
	if req.Name != "" {
		overrideName = &req.Name
	}
	availabilityOverrideID, parseErr := uuid.Parse(req.Id)
	if parseErr != nil {
		availabilityOverrideID = uuid.New()
	}
	err = s.repository.UpsertAvailabilityOverride(tx, model.ResourceAvailabilityOverride{
		ID:             availabilityOverrideID,
		ResourceID:     uuid.MustParse(req.ResourceId),
		AvailabilityID: availabilityId,
		Name:           overrideName,
		StartAt:        time.Unix(req.StartAtUnix, 0),
		EndAt:          time.Unix(req.EndAtUnix, 0),
	})
	if err != nil {
		return nil, err
	}
	err = tx.Commit()
	return nil, err
}
