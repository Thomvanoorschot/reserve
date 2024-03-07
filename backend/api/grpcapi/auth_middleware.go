package grpcapi

import (
	"context"
	"strings"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

var (
	errMissingMetadata = status.Errorf(codes.InvalidArgument, "missing metadata")
	errInvalidToken    = status.Errorf(codes.Unauthenticated, "invalid token")
)

var ignoreList = []string{
	"/proto.TenantService/RegisterTenant",
	"/proto.TestService/TestUnaryRPC",
}

func ValidateToken(ctx context.Context, req any, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (any, error) {
	for _, il := range ignoreList {
		if il == info.FullMethod {
			return handler(ctx, req)
		}
	}
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, errMissingMetadata
	}

	if !valid(md["authorization"]) {
		return nil, errInvalidToken
	}
	ctx = context.WithValue(ctx, "tenant", "test")

	return handler(ctx, req)
}

func valid(authorization []string) bool {
	if len(authorization) < 1 {
		return false
	}
	_ = strings.TrimPrefix(authorization[0], "Bearer ")

	// TODO Temporary always return true
	return true
}
