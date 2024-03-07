package grpcapi

import (
	"context"

	"reserve/generated/proto"
)

type TestHandler struct {
	proto.UnimplementedTestServiceServer
}

func NewTestHandler() *TestHandler {
	return &TestHandler{}
}

func (h *TestHandler) TestUnaryRPC(ctx context.Context, req *proto.TestRPCRequest) (*proto.TestRPCResponse, error) {
	return &proto.TestRPCResponse{TestField: "This is a test"}, nil
}
