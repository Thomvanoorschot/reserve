package availability

import (
	"context"
	"database/sql"
	"time"

	"reserve/generated/jet_gen/model"

	"github.com/google/uuid"
)

type Repository interface {
	GetAvailabilityRequirements(ctx context.Context, locationID uuid.UUID, startAt, endAt time.Time) (Requirements, error)
	UpsertResource(tenant string, m model.Resource) error

	Db(ctx context.Context) (*sql.DB, error)
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
