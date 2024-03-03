package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type TenantService interface {
	RegisterTenant(ctx context.Context, req *proto.RegisterTenantRequest, respCh chan *proto.RegisterTenantResponse, quitCh chan bool)
}

type TenantHandler struct {
	tenantService TenantService
	proto.UnimplementedTenantServiceServer
}

func NewTenantHandler(tenantService TenantService) *TenantHandler {
	return &TenantHandler{
		tenantService: tenantService,
	}
}

func (h *TenantHandler) RegisterTenant(req *proto.RegisterTenantRequest, s proto.TenantService_RegisterTenantServer) error {
	if req == nil {
		return status.Error(
			codes.InvalidArgument, "no request found",
		)
	}
	respCh := make(chan *proto.RegisterTenantResponse)
	quitCh := make(chan bool)
	go h.tenantService.RegisterTenant(s.Context(), req, respCh, quitCh)
	for {
		select {
		case res := <-respCh:
			if res.Error != "" {
				return status.Error(
					codes.Unknown, res.Error,
				)
			}
			err := s.Send(res)
			if err != nil {
				return err
			}

		case <-quitCh:
			return nil
		}
	}
}
