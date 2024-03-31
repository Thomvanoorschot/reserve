package availability

import (
	"time"

	"reserve/generated/jet_gen/model"
	"reserve/services"

	"github.com/google/uuid"
)

type Repository interface {
	services.BaseRepository
	GetAvailabilityRequirements(db services.QueryExecutor, locationID uuid.UUID, startAt, endAt time.Time) (Requirements, error)
	UpsertResource(db services.QueryExecutor, m model.Resource) error
	UpsertAvailability(db services.QueryExecutor, m model.Availability) (uuid.UUID, error)
	UpsertAvailabilityOverride(db services.QueryExecutor, m model.ResourceAvailabilityOverride) error
}

type Service struct {
	repository Repository
}

func NewService(
	repository Repository,
) *Service {
	return &Service{
		repository: repository,
	}
}
