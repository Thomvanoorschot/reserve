import 'package:frontend/generated/proto/location.pb.dart';
import 'package:frontend/src/models/location/location_model.dart';
import 'package:frontend/src/repositories/grpc_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locations.g.dart';

@riverpod
class Locations extends _$Locations {
  @override
  FutureOr<List<LocationModel>> build() async {
    return getLocations();
  }

  Future<List<LocationModel>> getLocations() async {
    var loc = await ref
        .read(locationServiceProvider)
        .getLocations(GetLocationsRequest());
    return loc.locations
        .map(
          (e) => LocationModel(
              id: e.id,
              name: e.name,
              availabilityRanges: List.empty(),
              tz: "Europe/Amsterdam"),
        )
        .toList();
  }
}
