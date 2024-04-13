// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationHash() => r'19de45688b3293733161077ff0db9a798edd63c9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Location
    extends BuildlessAutoDisposeAsyncNotifier<LocationModel> {
  late final String id;

  FutureOr<LocationModel> build(
    String id,
  );
}

/// See also [Location].
@ProviderFor(Location)
const locationProvider = LocationFamily();

/// See also [Location].
class LocationFamily extends Family<AsyncValue<LocationModel>> {
  /// See also [Location].
  const LocationFamily();

  /// See also [Location].
  LocationProvider call(
    String id,
  ) {
    return LocationProvider(
      id,
    );
  }

  @override
  LocationProvider getProviderOverride(
    covariant LocationProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'locationProvider';
}

/// See also [Location].
class LocationProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Location, LocationModel> {
  /// See also [Location].
  LocationProvider(
    String id,
  ) : this._internal(
          () => Location()..id = id,
          from: locationProvider,
          name: r'locationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationHash,
          dependencies: LocationFamily._dependencies,
          allTransitiveDependencies: LocationFamily._allTransitiveDependencies,
          id: id,
        );

  LocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<LocationModel> runNotifierBuild(
    covariant Location notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(Location Function() create) {
    return ProviderOverride(
      origin: this,
      override: LocationProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<Location, LocationModel>
      createElement() {
    return _LocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocationRef on AutoDisposeAsyncNotifierProviderRef<LocationModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LocationProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Location, LocationModel>
    with LocationRef {
  _LocationProviderElement(super.provider);

  @override
  String get id => (origin as LocationProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
