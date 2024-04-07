package location

import (
	"reserve/generated/jet_gen/model"
	"reserve/services"

	"github.com/google/uuid"
)

type Repository interface {
	services.BaseRepository
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