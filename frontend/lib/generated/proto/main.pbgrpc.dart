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
import 'main.pb.dart' as $3;
import 'reservation.pb.dart' as $1;
import 'tenant.pb.dart' as $2;

export 'main.pb.dart';

@$pb.GrpcServiceName('proto.AvailabilityService')
class AvailabilityServiceClient extends $grpc.Client {
  static final _$getStartTimes = $grpc.ClientMethod<$0.GetStartTimesRequest, $0.GetStartTimesResponse>(
      '/proto.AvailabilityService/GetStartTimes',
      ($0.GetStartTimesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStartTimesResponse.fromBuffer(value));
  static final _$upsertAvailabilityOverride = $grpc.ClientMethod<$0.UpsertAvailabilityOverrideRequest, $0.UpsertAvailabilityOverrideResponse>(
      '/proto.AvailabilityService/UpsertAvailabilityOverride',
      ($0.UpsertAvailabilityOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpsertAvailabilityOverrideResponse.fromBuffer(value));

  AvailabilityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetStartTimesResponse> getStartTimes($0.GetStartTimesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStartTimes, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride($0.UpsertAvailabilityOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertAvailabilityOverride, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.UpsertAvailabilityOverrideRequest, $0.UpsertAvailabilityOverrideResponse>(
        'UpsertAvailabilityOverride',
        upsertAvailabilityOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpsertAvailabilityOverrideRequest.fromBuffer(value),
        ($0.UpsertAvailabilityOverrideResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetStartTimesResponse> getStartTimes_Pre($grpc.ServiceCall call, $async.Future<$0.GetStartTimesRequest> request) async {
    return getStartTimes(call, await request);
  }

  $async.Future<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride_Pre($grpc.ServiceCall call, $async.Future<$0.UpsertAvailabilityOverrideRequest> request) async {
    return upsertAvailabilityOverride(call, await request);
  }

  $async.Future<$0.GetStartTimesResponse> getStartTimes($grpc.ServiceCall call, $0.GetStartTimesRequest request);
  $async.Future<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride($grpc.ServiceCall call, $0.UpsertAvailabilityOverrideRequest request);
}
@$pb.GrpcServiceName('proto.ReservationService')
class ReservationServiceClient extends $grpc.Client {
  static final _$upsertReservation = $grpc.ClientMethod<$1.UpsertReservationRequest, $1.UpsertReservationResponse>(
      '/proto.ReservationService/UpsertReservation',
      ($1.UpsertReservationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UpsertReservationResponse.fromBuffer(value));

  ReservationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.UpsertReservationResponse> upsertReservation($1.UpsertReservationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertReservation, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.ReservationService')
abstract class ReservationServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ReservationService';

  ReservationServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.UpsertReservationRequest, $1.UpsertReservationResponse>(
        'UpsertReservation',
        upsertReservation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpsertReservationRequest.fromBuffer(value),
        ($1.UpsertReservationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.UpsertReservationResponse> upsertReservation_Pre($grpc.ServiceCall call, $async.Future<$1.UpsertReservationRequest> request) async {
    return upsertReservation(call, await request);
  }

  $async.Future<$1.UpsertReservationResponse> upsertReservation($grpc.ServiceCall call, $1.UpsertReservationRequest request);
}
@$pb.GrpcServiceName('proto.TenantService')
class TenantServiceClient extends $grpc.Client {
  static final _$registerTenant = $grpc.ClientMethod<$2.RegisterTenantRequest, $2.RegisterTenantResponse>(
      '/proto.TenantService/RegisterTenant',
      ($2.RegisterTenantRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.RegisterTenantResponse.fromBuffer(value));

  TenantServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$2.RegisterTenantResponse> registerTenant($2.RegisterTenantRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$registerTenant, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('proto.TenantService')
abstract class TenantServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TenantService';

  TenantServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.RegisterTenantRequest, $2.RegisterTenantResponse>(
        'RegisterTenant',
        registerTenant_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.RegisterTenantRequest.fromBuffer(value),
        ($2.RegisterTenantResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$2.RegisterTenantResponse> registerTenant_Pre($grpc.ServiceCall call, $async.Future<$2.RegisterTenantRequest> request) async* {
    yield* registerTenant(call, await request);
  }

  $async.Stream<$2.RegisterTenantResponse> registerTenant($grpc.ServiceCall call, $2.RegisterTenantRequest request);
}
@$pb.GrpcServiceName('proto.TestService')
class TestServiceClient extends $grpc.Client {
  static final _$testUnaryRPC = $grpc.ClientMethod<$3.TestRPCRequest, $3.TestRPCResponse>(
      '/proto.TestService/TestUnaryRPC',
      ($3.TestRPCRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.TestRPCResponse.fromBuffer(value));

  TestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.TestRPCResponse> testUnaryRPC($3.TestRPCRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$testUnaryRPC, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.TestService')
abstract class TestServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TestService';

  TestServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.TestRPCRequest, $3.TestRPCResponse>(
        'TestUnaryRPC',
        testUnaryRPC_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TestRPCRequest.fromBuffer(value),
        ($3.TestRPCResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.TestRPCResponse> testUnaryRPC_Pre($grpc.ServiceCall call, $async.Future<$3.TestRPCRequest> request) async {
    return testUnaryRPC(call, await request);
  }

  $async.Future<$3.TestRPCResponse> testUnaryRPC($grpc.ServiceCall call, $3.TestRPCRequest request);
}
