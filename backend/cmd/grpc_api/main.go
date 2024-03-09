package main

import (
	"fmt"
	"net"
	"runtime/debug"

	"reserve/migrations"
	repo "reserve/repositories/turso"
	"reserve/services/availability"

	"github.com/bufbuild/protovalidate-go"
	protovalidatemiddleware "github.com/grpc-ecosystem/go-grpc-middleware/v2/interceptors/protovalidate"
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
	validator, err := protovalidate.New()

	opts := []grpc.ServerOption{
		grpc.ChainUnaryInterceptor(
			grpcapi.ValidateToken,
			protovalidatemiddleware.UnaryServerInterceptor(validator),
			recovery.UnaryServerInterceptor(recovery.WithRecoveryHandler(grpcPanicRecoveryHandler)),
		),
		grpc.ChainStreamInterceptor(
			protovalidatemiddleware.StreamServerInterceptor(validator),
			recovery.StreamServerInterceptor(recovery.WithRecoveryHandler(grpcPanicRecoveryHandler)),
		),
	}
	s := grpc.NewServer(opts...)
	reflection.Register(s)
	grpc_health_v1.RegisterHealthServer(s, health.NewServer())

	tursoCfg := config.LoadTursoConfig()
	tursoClient := turso.NewClient(tursoCfg)
	repository := repo.NewRepository(tursoClient)

	gcpConfig := config.LoadGCPConfig()
	firebaseClient := gcpfirebase.NewClient(gcpConfig)

	availabilityService := availability.NewService(repository)
	availabilityHandler := grpcapi.NewAvailabilityHandler(availabilityService)
	proto.RegisterAvailabilityServiceServer(s, availabilityHandler)

	migrator := migrations.NewMigrator()

	tenantService := tenant.NewService(tursoClient, firebaseClient, migrator, repository)
	tenantHandler := grpcapi.NewTenantHandler(tenantService)
	proto.RegisterTenantServiceServer(s, tenantHandler)

	testHandler := grpcapi.NewTestHandler()
	proto.RegisterTestServiceServer(s, testHandler)

	if err := s.Serve(listener); err != nil {
		log.Fatal().Msgf("failed to serve:%s", err)
	}
}
