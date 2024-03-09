// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v4.24.3
// source: main.proto

package proto

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// AvailabilityServiceClient is the client API for AvailabilityService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AvailabilityServiceClient interface {
	UpsertResource(ctx context.Context, in *UpsertResourceRequest, opts ...grpc.CallOption) (*UpsertResourceResponse, error)
}

type availabilityServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewAvailabilityServiceClient(cc grpc.ClientConnInterface) AvailabilityServiceClient {
	return &availabilityServiceClient{cc}
}

func (c *availabilityServiceClient) UpsertResource(ctx context.Context, in *UpsertResourceRequest, opts ...grpc.CallOption) (*UpsertResourceResponse, error) {
	out := new(UpsertResourceResponse)
	err := c.cc.Invoke(ctx, "/proto.AvailabilityService/UpsertResource", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AvailabilityServiceServer is the server API for AvailabilityService service.
// All implementations must embed UnimplementedAvailabilityServiceServer
// for forward compatibility
type AvailabilityServiceServer interface {
	UpsertResource(context.Context, *UpsertResourceRequest) (*UpsertResourceResponse, error)
	mustEmbedUnimplementedAvailabilityServiceServer()
}

// UnimplementedAvailabilityServiceServer must be embedded to have forward compatible implementations.
type UnimplementedAvailabilityServiceServer struct {
}

func (UnimplementedAvailabilityServiceServer) UpsertResource(context.Context, *UpsertResourceRequest) (*UpsertResourceResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpsertResource not implemented")
}
func (UnimplementedAvailabilityServiceServer) mustEmbedUnimplementedAvailabilityServiceServer() {}

// UnsafeAvailabilityServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AvailabilityServiceServer will
// result in compilation errors.
type UnsafeAvailabilityServiceServer interface {
	mustEmbedUnimplementedAvailabilityServiceServer()
}

func RegisterAvailabilityServiceServer(s grpc.ServiceRegistrar, srv AvailabilityServiceServer) {
	s.RegisterService(&AvailabilityService_ServiceDesc, srv)
}

func _AvailabilityService_UpsertResource_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(UpsertResourceRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AvailabilityServiceServer).UpsertResource(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/proto.AvailabilityService/UpsertResource",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AvailabilityServiceServer).UpsertResource(ctx, req.(*UpsertResourceRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// AvailabilityService_ServiceDesc is the grpc.ServiceDesc for AvailabilityService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var AvailabilityService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "proto.AvailabilityService",
	HandlerType: (*AvailabilityServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "UpsertResource",
			Handler:    _AvailabilityService_UpsertResource_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "main.proto",
}

// TenantServiceClient is the client API for TenantService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type TenantServiceClient interface {
	RegisterTenant(ctx context.Context, in *RegisterTenantRequest, opts ...grpc.CallOption) (TenantService_RegisterTenantClient, error)
}

type tenantServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewTenantServiceClient(cc grpc.ClientConnInterface) TenantServiceClient {
	return &tenantServiceClient{cc}
}

func (c *tenantServiceClient) RegisterTenant(ctx context.Context, in *RegisterTenantRequest, opts ...grpc.CallOption) (TenantService_RegisterTenantClient, error) {
	stream, err := c.cc.NewStream(ctx, &TenantService_ServiceDesc.Streams[0], "/proto.TenantService/RegisterTenant", opts...)
	if err != nil {
		return nil, err
	}
	x := &tenantServiceRegisterTenantClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type TenantService_RegisterTenantClient interface {
	Recv() (*RegisterTenantResponse, error)
	grpc.ClientStream
}

type tenantServiceRegisterTenantClient struct {
	grpc.ClientStream
}

func (x *tenantServiceRegisterTenantClient) Recv() (*RegisterTenantResponse, error) {
	m := new(RegisterTenantResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

// TenantServiceServer is the server API for TenantService service.
// All implementations must embed UnimplementedTenantServiceServer
// for forward compatibility
type TenantServiceServer interface {
	RegisterTenant(*RegisterTenantRequest, TenantService_RegisterTenantServer) error
	mustEmbedUnimplementedTenantServiceServer()
}

// UnimplementedTenantServiceServer must be embedded to have forward compatible implementations.
type UnimplementedTenantServiceServer struct {
}

func (UnimplementedTenantServiceServer) RegisterTenant(*RegisterTenantRequest, TenantService_RegisterTenantServer) error {
	return status.Errorf(codes.Unimplemented, "method RegisterTenant not implemented")
}
func (UnimplementedTenantServiceServer) mustEmbedUnimplementedTenantServiceServer() {}

// UnsafeTenantServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to TenantServiceServer will
// result in compilation errors.
type UnsafeTenantServiceServer interface {
	mustEmbedUnimplementedTenantServiceServer()
}

func RegisterTenantServiceServer(s grpc.ServiceRegistrar, srv TenantServiceServer) {
	s.RegisterService(&TenantService_ServiceDesc, srv)
}

func _TenantService_RegisterTenant_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(RegisterTenantRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(TenantServiceServer).RegisterTenant(m, &tenantServiceRegisterTenantServer{stream})
}

type TenantService_RegisterTenantServer interface {
	Send(*RegisterTenantResponse) error
	grpc.ServerStream
}

type tenantServiceRegisterTenantServer struct {
	grpc.ServerStream
}

func (x *tenantServiceRegisterTenantServer) Send(m *RegisterTenantResponse) error {
	return x.ServerStream.SendMsg(m)
}

// TenantService_ServiceDesc is the grpc.ServiceDesc for TenantService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var TenantService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "proto.TenantService",
	HandlerType: (*TenantServiceServer)(nil),
	Methods:     []grpc.MethodDesc{},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "RegisterTenant",
			Handler:       _TenantService_RegisterTenant_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "main.proto",
}

// TestServiceClient is the client API for TestService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type TestServiceClient interface {
	TestUnaryRPC(ctx context.Context, in *TestRPCRequest, opts ...grpc.CallOption) (*TestRPCResponse, error)
}

type testServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewTestServiceClient(cc grpc.ClientConnInterface) TestServiceClient {
	return &testServiceClient{cc}
}

func (c *testServiceClient) TestUnaryRPC(ctx context.Context, in *TestRPCRequest, opts ...grpc.CallOption) (*TestRPCResponse, error) {
	out := new(TestRPCResponse)
	err := c.cc.Invoke(ctx, "/proto.TestService/TestUnaryRPC", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// TestServiceServer is the server API for TestService service.
// All implementations must embed UnimplementedTestServiceServer
// for forward compatibility
type TestServiceServer interface {
	TestUnaryRPC(context.Context, *TestRPCRequest) (*TestRPCResponse, error)
	mustEmbedUnimplementedTestServiceServer()
}

// UnimplementedTestServiceServer must be embedded to have forward compatible implementations.
type UnimplementedTestServiceServer struct {
}

func (UnimplementedTestServiceServer) TestUnaryRPC(context.Context, *TestRPCRequest) (*TestRPCResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method TestUnaryRPC not implemented")
}
func (UnimplementedTestServiceServer) mustEmbedUnimplementedTestServiceServer() {}

// UnsafeTestServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to TestServiceServer will
// result in compilation errors.
type UnsafeTestServiceServer interface {
	mustEmbedUnimplementedTestServiceServer()
}

func RegisterTestServiceServer(s grpc.ServiceRegistrar, srv TestServiceServer) {
	s.RegisterService(&TestService_ServiceDesc, srv)
}

func _TestService_TestUnaryRPC_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TestRPCRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TestServiceServer).TestUnaryRPC(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/proto.TestService/TestUnaryRPC",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TestServiceServer).TestUnaryRPC(ctx, req.(*TestRPCRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// TestService_ServiceDesc is the grpc.ServiceDesc for TestService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var TestService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "proto.TestService",
	HandlerType: (*TestServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "TestUnaryRPC",
			Handler:    _TestService_TestUnaryRPC_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "main.proto",
}
