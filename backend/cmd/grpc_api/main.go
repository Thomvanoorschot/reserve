package main

import (
	"log"
	"net/http"

	"reserve/api/grpcapi"
	"reserve/clients/gcpfirebase"
	"reserve/clients/turso"
	"reserve/config"
	"reserve/generated/proto/protoconnect"
	"reserve/migrations"
	repo "reserve/repositories/turso"
	"reserve/services/location"
	"reserve/services/reservation"
	"reserve/services/tenant"

	"connectrpc.com/connect"
	connectcors "connectrpc.com/cors"
	"connectrpc.com/grpcreflect"
	"github.com/rs/cors"
	"golang.org/x/net/http2"
	"golang.org/x/net/http2/h2c"
	"google.golang.org/protobuf/reflect/protoregistry"
)

type ServiceNames []string

func (s ServiceNames) Names() []string {
	return s
}

func main() {
	interceptors := connect.WithInterceptors(grpcapi.NewAuthInterceptor())

	tursoCfg := config.LoadTursoConfig()
	tursoClient := turso.NewClient(tursoCfg)
	repository := repo.NewRepository(tursoClient)
	gcpConfig := config.LoadGCPConfig()
	firebaseClient := gcpfirebase.NewClient(gcpConfig)
	migrator := migrations.NewMigrator()

	mux := http.NewServeMux()

	// Test
	testPath, testHandler := protoconnect.NewTestServiceHandler(grpcapi.NewTestHandler(), interceptors)
	mux.Handle(testPath, testHandler)

	// Location
	locationService := location.NewService(repository)
	locationPath, locationHandler := protoconnect.NewLocationServiceHandler(grpcapi.NewLocationHandler(locationService), interceptors)
	mux.Handle(locationPath, locationHandler)

	// Reservation
	reservationService := reservation.NewService(repository)
	reservationPath, reservationHandler := protoconnect.NewReservationServiceHandler(grpcapi.NewReservationHandler(reservationService), interceptors)
	mux.Handle(reservationPath, reservationHandler)

	// Tenant
	tenantService := tenant.NewService(tursoClient, firebaseClient, migrator, repository)
	tenantPath, tenantHandler := protoconnect.NewTenantServiceHandler(grpcapi.NewTenantHandler(tenantService), interceptors)
	mux.Handle(tenantPath, tenantHandler)

	reflector := grpcreflect.NewReflector(
		ServiceNames{protoconnect.TestServiceName},
		grpcreflect.WithExtensionResolver(protoregistry.GlobalTypes),
		grpcreflect.WithDescriptorResolver(protoregistry.GlobalFiles),
	)
	mux.Handle(grpcreflect.NewHandlerV1(reflector))
	mux.Handle(grpcreflect.NewHandlerV1Alpha(reflector))

	c := cors.New(cors.Options{
		AllowedOrigins: []string{"*"}, // replace with your domain
		AllowedMethods: connectcors.AllowedMethods(),
		AllowedHeaders: connectcors.AllowedHeaders(),
		ExposedHeaders: connectcors.ExposedHeaders(),
		MaxAge:         7200, // 2 hours in seconds
	})
	err := http.ListenAndServe(
		"localhost:8080",
		h2c.NewHandler(c.Handler(mux), &http2.Server{}),
	)
	if err != nil {
		log.Fatal("failed to server")
	}
}
