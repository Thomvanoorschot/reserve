// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grpc_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$grpcClientHash() => r'95ae9382dbda6fd3a3f6a6928671f04c5844f3ca';

/// See also [grpcClient].
@ProviderFor(grpcClient)
final grpcClientProvider =
    AutoDisposeProvider<GrpcOrGrpcWebClientChannel>.internal(
  grpcClient,
  name: r'grpcClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$grpcClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GrpcClientRef = AutoDisposeProviderRef<GrpcOrGrpcWebClientChannel>;
String _$availabilityServiceHash() =>
    r'5958d1287d6bc0e9993d7d030d3960bd5b445dc1';

/// See also [availabilityService].
@ProviderFor(availabilityService)
final availabilityServiceProvider =
    AutoDisposeProvider<AvailabilityServiceClient>.internal(
  availabilityService,
  name: r'availabilityServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availabilityServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AvailabilityServiceRef
    = AutoDisposeProviderRef<AvailabilityServiceClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member