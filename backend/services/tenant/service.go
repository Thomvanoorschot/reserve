package tenant

import (
	"context"
	"fmt"

	"reserve/clients/turso"
	"reserve/generated/proto"
)

const Organization = "thomvanoorschot" // TODO Temporary

type DbProvider interface {
	CreateGroup(cgr turso.CreateGroupRequest) (g turso.Group, err error)
	CreateDatabase(dbr turso.CreateDatabaseRequest) (db turso.Database, err error)
}
type IdentityProvider interface {
	CreateTenant(ctx context.Context, name string) (string, error)
	CreateAdmin(ctx context.Context, tenantID, email, password string) error
}

type Service struct {
	dbProvider       DbProvider
	identityProvider IdentityProvider
}

func NewService(dbProvider DbProvider, identityProvider IdentityProvider) *Service {
	return &Service{
		dbProvider:       dbProvider,
		identityProvider: identityProvider,
	}
}

func (s *Service) RegisterTenant(ctx context.Context, req *proto.RegisterTenantRequest, respCh chan *proto.RegisterTenantResponse, quitCh chan bool) {
	respCh <- &proto.RegisterTenantResponse{Status: "Creating Identity tenant"}
	tenantID, err := s.identityProvider.CreateTenant(ctx, req.Name)
	if err != nil {
		respCh <- &proto.RegisterTenantResponse{Error: err.Error()}
	}

	respCh <- &proto.RegisterTenantResponse{Status: "Creating Administrator account"}
	err = s.identityProvider.CreateAdmin(ctx, tenantID, req.Email, req.Password)
	if err != nil {
		respCh <- &proto.RegisterTenantResponse{Error: err.Error()}
	}

	respCh <- &proto.RegisterTenantResponse{Status: "Creating Group"}
	group, err := s.dbProvider.CreateGroup(turso.CreateGroupRequest{
		Organization: Organization,
		Location:     req.Location,
		Name:         req.Name,
	})
	if err != nil {
		respCh <- &proto.RegisterTenantResponse{Error: err.Error()}
	}

	respCh <- &proto.RegisterTenantResponse{Status: "Creating database"}
	db, err := s.dbProvider.CreateDatabase(turso.CreateDatabaseRequest{
		Organization: Organization,
		Group:        group.Name,
		Name:         req.Name,
		SizeLimit:    "256mb",
	})
	if err != nil {
		respCh <- &proto.RegisterTenantResponse{Error: err.Error()}
	}

	fmt.Println(db.Hostname)
	quitCh <- true
}
