package main

import (
	"fmt"
	"net"
	"runtime/debug"

	"github.com/rs/zerolog/log"

	"reserve/api/grpcapi"
	"reserve/clients/gcpfirebase"
	"reserve/clients/turso"
	"reserve/config"
	"reserve/generated/proto"
	"reserve/services/tenant"

	"github.com/grpc-ecosystem/go-grpc-middleware/v2/interceptors/recovery"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/health"
	"google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

func main() {
	apiCfg := config.LoadApiConfig()
	listener, err := net.Listen("tcp", fmt.Sprintf(":%s", apiCfg.APIPort))
	if err != nil {
		log.Fatal().Msgf("failed to create listener: %s", err)
	}

	grpcPanicRecoveryHandler := func(p any) (err error) {
		log.Error().Msgf("recovered from panic %s", string(debug.Stack()))
		return status.Errorf(codes.Internal, "%s", p)
	}

	opts := []grpc.ServerOption{
		grpc.ChainUnaryInterceptor(
			grpcapi.ValidateToken,
			recovery.UnaryServerInterceptor(recovery.WithRecoveryHandler(grpcPanicRecoveryHandler)),
		),
		grpc.ChainStreamInterceptor(
			recovery.StreamServerInterceptor(recovery.WithRecoveryHandler(grpcPanicRecoveryHandler)),
		),
	}
	s := grpc.NewServer(opts...)
	reflection.Register(s)
	grpc_health_v1.RegisterHealthServer(s, health.NewServer())

	tursoCfg := config.LoadTursoConfig()
	tursoClient := turso.NewClient(tursoCfg)

	gcpConfig := config.LoadGCPConfig()
	firebaseClient := gcpfirebase.NewClient(gcpConfig)

	availabilityHandler := grpcapi.NewAvailabilityHandler(nil)
	proto.RegisterAvailabilityServiceServer(s, availabilityHandler)

	tenantService := tenant.NewService(tursoClient, firebaseClient)
	tenantHandler := grpcapi.NewTenantHandler(tenantService)
	proto.RegisterTenantServiceServer(s, tenantHandler)

	if err := s.Serve(listener); err != nil {
		log.Fatal().Msgf("failed to serve:%s", err)
	}
}
