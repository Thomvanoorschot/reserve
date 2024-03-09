package availability

import (
	"context"
	"database/sql"

	"reserve/generated/jet_gen/model"
	"reserve/generated/proto"
	"reserve/utils/bitutils"
)

type Repository interface {
	UpsertResource(tenant string, m model.Resource) error

	Db(tenant string) (*sql.DB, error)
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

func (s *Service) UpsertResource(ctx context.Context, req *proto.UpsertResourceRequest) (*proto.UpsertResourceResponse, error) {
	a1 := bitutils.ConvertToBits(([48]bool)(req.Availability[:48]))
	a2 := bitutils.ConvertToBits(([48]bool)(req.Availability[48:]))
	err := s.repository.UpsertResource("test", model.Resource{
		ID:                   &req.Id,
		Name:                 req.Name,
		LocationID:           req.LocationId,
		DefaultAvailability1: a1,
		DefaultAvailability2: a2,
	})
	if err != nil {
		return nil, err
	}
	return nil, nil
}
