package location

import (
	"reserve/generated/jet_gen/model"
	"reserve/services"

	"github.com/google/uuid"
)

type Repository interface {
	services.BaseRepository
	GetLocationByID(db services.QueryExecutor, id uuid.UUID) (resp Model, err error)
	GetLocations(db services.QueryExecutor) (resp []Model, err error)
	UpsertLocation(db services.QueryExecutor, location model.Location) (uuid.UUID, error)
	UpsertAvailability(db services.QueryExecutor, m model.Availability) (uuid.UUID, error)
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
