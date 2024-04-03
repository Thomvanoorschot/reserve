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
import 'location.pb.dart' as $1;
import 'main.pb.dart' as $4;
import 'reservation.pb.dart' as $2;
import 'tenant.pb.dart' as $3;

export 'main.pb.dart';

@$pb.GrpcServiceName('proto.AvailabilityService')
class AvailabilityServiceClient extends $grpc.Client {
  static final _$updateLocationDefaultAvailability = $grpc.ClientMethod<$0.UpdateLocationDefaultAvailabilityRequest, $0.UpdateLocationDefaultAvailabilityResponse>(
      '/proto.AvailabilityService/UpdateLocationDefaultAvailability',
      ($0.UpdateLocationDefaultAvailabilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateLocationDefaultAvailabilityResponse.fromBuffer(value));
  static final _$getAvailableTimeslots = $grpc.ClientMethod<$0.GetAvailableTimeslotsRequest, $0.GetAvailableTimeslotsResponse>(
      '/proto.AvailabilityService/GetAvailableTimeslots',
      ($0.GetAvailableTimeslotsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAvailableTimeslotsResponse.fromBuffer(value));
  static final _$getAvailableDays = $grpc.ClientMethod<$0.GetAvailableDaysRequest, $0.GetAvailableDaysResponse>(
      '/proto.AvailabilityService/GetAvailableDays',
      ($0.GetAvailableDaysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetAvailableDaysResponse.fromBuffer(value));
  static final _$upsertAvailabilityOverride = $grpc.ClientMethod<$0.UpsertAvailabilityOverrideRequest, $0.UpsertAvailabilityOverrideResponse>(
      '/proto.AvailabilityService/UpsertAvailabilityOverride',
      ($0.UpsertAvailabilityOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpsertAvailabilityOverrideResponse.fromBuffer(value));

  AvailabilityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.UpdateLocationDefaultAvailabilityResponse> updateLocationDefaultAvailability($0.UpdateLocationDefaultAvailabilityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLocationDefaultAvailability, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAvailableTimeslotsResponse> getAvailableTimeslots($0.GetAvailableTimeslotsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableTimeslots, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAvailableDaysResponse> getAvailableDays($0.GetAvailableDaysRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableDays, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride($0.UpsertAvailabilityOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertAvailabilityOverride, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.AvailabilityService')
abstract class AvailabilityServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.AvailabilityService';

  AvailabilityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UpdateLocationDefaultAvailabilityRequest, $0.UpdateLocationDefaultAvailabilityResponse>(
        'UpdateLocationDefaultAvailability',
        updateLocationDefaultAvailability_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateLocationDefaultAvailabilityRequest.fromBuffer(value),
        ($0.UpdateLocationDefaultAvailabilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAvailableTimeslotsRequest, $0.GetAvailableTimeslotsResponse>(
        'GetAvailableTimeslots',
        getAvailableTimeslots_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAvailableTimeslotsRequest.fromBuffer(value),
        ($0.GetAvailableTimeslotsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAvailableDaysRequest, $0.GetAvailableDaysResponse>(
        'GetAvailableDays',
        getAvailableDays_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAvailableDaysRequest.fromBuffer(value),
        ($0.GetAvailableDaysResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpsertAvailabilityOverrideRequest, $0.UpsertAvailabilityOverrideResponse>(
        'UpsertAvailabilityOverride',
        upsertAvailabilityOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpsertAvailabilityOverrideRequest.fromBuffer(value),
        ($0.UpsertAvailabilityOverrideResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UpdateLocationDefaultAvailabilityResponse> updateLocationDefaultAvailability_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateLocationDefaultAvailabilityRequest> request) async {
    return updateLocationDefaultAvailability(call, await request);
  }

  $async.Future<$0.GetAvailableTimeslotsResponse> getAvailableTimeslots_Pre($grpc.ServiceCall call, $async.Future<$0.GetAvailableTimeslotsRequest> request) async {
    return getAvailableTimeslots(call, await request);
  }

  $async.Future<$0.GetAvailableDaysResponse> getAvailableDays_Pre($grpc.ServiceCall call, $async.Future<$0.GetAvailableDaysRequest> request) async {
    return getAvailableDays(call, await request);
  }

  $async.Future<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride_Pre($grpc.ServiceCall call, $async.Future<$0.UpsertAvailabilityOverrideRequest> request) async {
    return upsertAvailabilityOverride(call, await request);
  }

  $async.Future<$0.UpdateLocationDefaultAvailabilityResponse> updateLocationDefaultAvailability($grpc.ServiceCall call, $0.UpdateLocationDefaultAvailabilityRequest request);
  $async.Future<$0.GetAvailableTimeslotsResponse> getAvailableTimeslots($grpc.ServiceCall call, $0.GetAvailableTimeslotsRequest request);
  $async.Future<$0.GetAvailableDaysResponse> getAvailableDays($grpc.ServiceCall call, $0.GetAvailableDaysRequest request);
  $async.Future<$0.UpsertAvailabilityOverrideResponse> upsertAvailabilityOverride($grpc.ServiceCall call, $0.UpsertAvailabilityOverrideRequest request);
}
@$pb.GrpcServiceName('proto.LocationService')
class LocationServiceClient extends $grpc.Client {
  static final _$upsertLocation = $grpc.ClientMethod<$1.UpsertLocationRequest, $1.UpsertLocationResponse>(
      '/proto.LocationService/UpsertLocation',
      ($1.UpsertLocationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UpsertLocationResponse.fromBuffer(value));

  LocationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.UpsertLocationResponse> upsertLocation($1.UpsertLocationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertLocation, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.LocationService')
abstract class LocationServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.LocationService';

  LocationServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.UpsertLocationRequest, $1.UpsertLocationResponse>(
        'UpsertLocation',
        upsertLocation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpsertLocationRequest.fromBuffer(value),
        ($1.UpsertLocationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.UpsertLocationResponse> upsertLocation_Pre($grpc.ServiceCall call, $async.Future<$1.UpsertLocationRequest> request) async {
    return upsertLocation(call, await request);
  }

  $async.Future<$1.UpsertLocationResponse> upsertLocation($grpc.ServiceCall call, $1.UpsertLocationRequest request);
}
@$pb.GrpcServiceName('proto.ReservationService')
class ReservationServiceClient extends $grpc.Client {
  static final _$upsertReservation = $grpc.ClientMethod<$2.UpsertReservationRequest, $2.UpsertReservationResponse>(
      '/proto.ReservationService/UpsertReservation',
      ($2.UpsertReservationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UpsertReservationResponse.fromBuffer(value));

  ReservationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.UpsertReservationResponse> upsertReservation($2.UpsertReservationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upsertReservation, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.ReservationService')
abstract class ReservationServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.ReservationService';

  ReservationServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UpsertReservationRequest, $2.UpsertReservationResponse>(
        'UpsertReservation',
        upsertReservation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpsertReservationRequest.fromBuffer(value),
        ($2.UpsertReservationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.UpsertReservationResponse> upsertReservation_Pre($grpc.ServiceCall call, $async.Future<$2.UpsertReservationRequest> request) async {
    return upsertReservation(call, await request);
  }

  $async.Future<$2.UpsertReservationResponse> upsertReservation($grpc.ServiceCall call, $2.UpsertReservationRequest request);
}
@$pb.GrpcServiceName('proto.TenantService')
class TenantServiceClient extends $grpc.Client {
  static final _$registerTenant = $grpc.ClientMethod<$3.RegisterTenantRequest, $3.RegisterTenantResponse>(
      '/proto.TenantService/RegisterTenant',
      ($3.RegisterTenantRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.RegisterTenantResponse.fromBuffer(value));

  TenantServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$3.RegisterTenantResponse> registerTenant($3.RegisterTenantRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$registerTenant, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('proto.TenantService')
abstract class TenantServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TenantService';

  TenantServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.RegisterTenantRequest, $3.RegisterTenantResponse>(
        'RegisterTenant',
        registerTenant_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.RegisterTenantRequest.fromBuffer(value),
        ($3.RegisterTenantResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$3.RegisterTenantResponse> registerTenant_Pre($grpc.ServiceCall call, $async.Future<$3.RegisterTenantRequest> request) async* {
    yield* registerTenant(call, await request);
  }

  $async.Stream<$3.RegisterTenantResponse> registerTenant($grpc.ServiceCall call, $3.RegisterTenantRequest request);
}
@$pb.GrpcServiceName('proto.TestService')
class TestServiceClient extends $grpc.Client {
  static final _$testUnaryRPC = $grpc.ClientMethod<$4.TestRPCRequest, $4.TestRPCResponse>(
      '/proto.TestService/TestUnaryRPC',
      ($4.TestRPCRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.TestRPCResponse.fromBuffer(value));

  TestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.TestRPCResponse> testUnaryRPC($4.TestRPCRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$testUnaryRPC, request, options: options);
  }
}

@$pb.GrpcServiceName('proto.TestService')
abstract class TestServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.TestService';

  TestServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.TestRPCRequest, $4.TestRPCResponse>(
        'TestUnaryRPC',
        testUnaryRPC_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.TestRPCRequest.fromBuffer(value),
        ($4.TestRPCResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.TestRPCResponse> testUnaryRPC_Pre($grpc.ServiceCall call, $async.Future<$4.TestRPCRequest> request) async {
    return testUnaryRPC(call, await request);
  }

  $async.Future<$4.TestRPCResponse> testUnaryRPC($grpc.ServiceCall call, $4.TestRPCRequest request);
}
