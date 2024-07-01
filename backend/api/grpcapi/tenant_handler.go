package grpcapi

import (
	"context"

	"reserve/generated/proto"

	"connectrpc.com/connect"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type TenantService interface {
	RegisterTenant(ctx context.Context, req *proto.RegisterTenantRequest, respCh chan *proto.RegisterTenantResponse, quitCh chan bool)
}

type TenantHandler struct {
	tenantService TenantService
}

func NewTenantHandler(tenantService TenantService) *TenantHandler {
	return &TenantHandler{
		tenantService: tenantService,
	}
}

func (h *TenantHandler) RegisterTenant(
	ctx context.Context,
	req *connect.Request[proto.RegisterTenantRequest],
	resp *connect.ServerStream[proto.RegisterTenantResponse],
) error {
	if req == nil {
		return status.Error(
			codes.InvalidArgument, "no request found",
		)
	}

	respCh := make(chan *proto.RegisterTenantResponse)
	quitCh := make(chan bool)
	go h.tenantService.RegisterTenant(ctx, req.Msg, respCh, quitCh)

	for {
		select {
		case res := <-respCh:

			if res.Error != "" {
				return status.Error(
					codes.Unknown, res.Error,
				)
			}
			err := resp.Send(res)
			if err != nil {
				return err
			}

		case <-quitCh:
			return nil
		}
	}
}
