//
//  Generated code. Do not modify.
//  source: main.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'availability.pb.dart' as $0;
import 'main.pb.dart' as $2;
import 'tenant.pb.dart' as $1;

export 'main.pb.dart';

@$pb.GrpcServiceName('proto.AvailabilityService')
class AvailabilityServiceClient extends $grpc.Client {
  static final _$getStartTimes = $grpc.ClientMethod<$0.GetStartTimesRequest, $0.GetStartTimesResponse>(
      '/proto.AvailabilityService/GetStartTimes',
      ($0.GetStartTimesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStartTimesResponse.fromBuffer(value));

  AvailabilityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetStartTimesResponse> getStartTimes($0.GetStartTimesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStartTimes, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.AvailabilityService')
abstract class AvailabilityServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.AvailabilityService';

  AvailabilityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetStartTimesRequest, $0.GetStartTimesResponse>(
        'GetStartTimes',
        getStartTimes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStartTimesRequest.fromBuffer(value),
        ($0.GetStartTimesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetStartTimesResponse> getStartTimes_Pre($grpc.ServiceCall call, $async.Future<$0.GetStartTimesRequest> request) async {
    return getStartTimes(call, await request);
  }

  $async.Future<$0.GetStartTimesResponse> getStartTimes($grpc.ServiceCall call, $0.GetStartTimesRequest request);
}
@$pb.GrpcServiceName('proto.TenantService')
class TenantServiceClient extends $grpc.Client {
  static final _$registerTenant = $grpc.ClientMethod<$1.RegisterTenantRequest, $1.RegisterTenantResponse>(
      '/proto.TenantService/RegisterTenant',
      ($1.RegisterTenantRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RegisterTenantResponse.fromBuffer(value));

  TenantServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$1.RegisterTenantResponse> registerTenant($1.RegisterTenantRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$registerTenant, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('proto.TenantService')
abstract class TenantServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TenantService';

  TenantServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.RegisterTenantRequest, $1.RegisterTenantResponse>(
        'RegisterTenant',
        registerTenant_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.RegisterTenantRequest.fromBuffer(value),
        ($1.RegisterTenantResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$1.RegisterTenantResponse> registerTenant_Pre($grpc.ServiceCall call, $async.Future<$1.RegisterTenantRequest> request) async* {
    yield* registerTenant(call, await request);
  }

  $async.Stream<$1.RegisterTenantResponse> registerTenant($grpc.ServiceCall call, $1.RegisterTenantRequest request);
}
@$pb.GrpcServiceName('proto.TestService')
class TestServiceClient extends $grpc.Client {
  static final _$testUnaryRPC = $grpc.ClientMethod<$2.TestRPCRequest, $2.TestRPCResponse>(
      '/proto.TestService/TestUnaryRPC',
      ($2.TestRPCRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TestRPCResponse.fromBuffer(value));

  TestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.TestRPCResponse> testUnaryRPC($2.TestRPCRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$testUnaryRPC, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.TestService')
abstract class TestServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TestService';

  TestServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.TestRPCRequest, $2.TestRPCResponse>(
        'TestUnaryRPC',
        testUnaryRPC_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TestRPCRequest.fromBuffer(value),
        ($2.TestRPCResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.TestRPCResponse> testUnaryRPC_Pre($grpc.ServiceCall call, $async.Future<$2.TestRPCRequest> request) async {
    return testUnaryRPC(call, await request);
  }

  $async.Future<$2.TestRPCResponse> testUnaryRPC($grpc.ServiceCall call, $2.TestRPCRequest request);
}
