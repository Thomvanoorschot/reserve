package reservation

import (
	"reserve/generated/jet_gen/model"
	"reserve/services"

	"github.com/google/uuid"
)

type Repository interface {
	services.BaseRepository
	UpsertReservation(db services.QueryExecutor, m model.Reservation) (resp uuid.UUID, err error)
}

type Service struct {
	repository Repository
}

func NewService(repo Repository) *Service {
	return &Service{
		repo,
	}
}
