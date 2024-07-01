package grpcapi

import (
	"context"
	"log"

	"reserve/generated/proto"

	"connectrpc.com/connect"
)

type TestHandler struct {
	//proto.UnimplementedTestServiceServer
}

func NewTestHandler() *TestHandler {
	return &TestHandler{}
}

func (h *TestHandler) TestUnaryRPC(
	ctx context.Context,
	req *connect.Request[proto.TestRPCRequest],
) (*connect.Response[proto.TestRPCResponse], error) {
	log.Println("Request headers: ", req.Header())
	res := connect.NewResponse(&proto.TestRPCResponse{TestField: "AAAAAAAAAAAAAAAAAAAAAAAAa"})
	res.Header().Set("Greet-Version", "v1")
	return res, nil
}
