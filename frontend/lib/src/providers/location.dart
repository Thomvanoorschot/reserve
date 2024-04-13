import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/generated/proto/location.pb.dart';
import 'package:frontend/src/models/availability/availability_day_model.dart';
import 'package:frontend/src/models/location/location_model.dart';
import 'package:frontend/src/repositories/grpc_client.dart';
import 'package:frontend/src/utils/epoch.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
class Location extends _$Location {
  @override
  FutureOr<LocationModel> build(String id) async {
    return getLocation(id);
  }

  Future<LocationModel> getLocation(String id) async {
    if (id.isEmpty) {
      return LocationModel(
        id: "",
        name: "",
        tz: "Europe/Amsterdam",
        availabilityRanges: List.from(
          [
            AvailabilityDayModel(name: "Monday"),
            AvailabilityDayModel(name: "Tuesday"),
            AvailabilityDayModel(name: "Wednesday"),
            AvailabilityDayModel(name: "Thursday"),
            AvailabilityDayModel(name: "Friday"),
            AvailabilityDayModel(name: "Saturday"),
            AvailabilityDayModel(name: "Sunday"),
          ],
        ),
      );
    }
    var loc = await ref
        .read(locationServiceProvider)
        .getLocationByID(GetLocationByIDRequest(id: id));
    List<AvailabilityDayModel> ar = List.empty(growable: true);

    if (loc.defaultMondayAvailability.isNotEmpty) {
      ar.add(

        AvailabilityDayModel.def(
          name: "Monday",
          availabilityRanges: loc.defaultMondayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Monday"));
    }

    if (loc.defaultTuesdayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Tuesday",
          availabilityRanges: loc.defaultTuesdayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Tuesday"));
    }

    if (loc.defaultWednesdayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Wednesday",
          availabilityRanges: loc.defaultWednesdayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Wednesday"));
    }

    if (loc.defaultThursdayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Thursday",
          availabilityRanges: loc.defaultThursdayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Thursday"));
    }

    if (loc.defaultFridayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Friday",
          availabilityRanges: loc.defaultFridayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Friday"));
    }

    if (loc.defaultSaturdayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Saturday",
          availabilityRanges: loc.defaultSaturdayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Saturday"));
    }

    if (loc.defaultSundayAvailability.isNotEmpty) {
      ar.add(
        AvailabilityDayModel.def(
          name: "Sunday",
          availabilityRanges: loc.defaultSundayAvailability
              .map((e) => AvailabilityRange(startAtUnix: e.startAtUnix, endAtUnix: e.endAtUnix))
              .toList(),
          enabled: true,
        ),
      );
    } else {
      ar.add(AvailabilityDayModel(name: "Sunday"));
    }

    return LocationModel(
      id: loc.id,
      name: loc.name,
      availabilityRanges: ar,
      tz: loc.tz,
    );
  }

  void updateTZ(String tz) {
    state = AsyncValue.data(state.value!.copyWith(tz: tz));
  }

  Future<void> upsertLocation() async {
    await ref.read(locationServiceProvider).upsertLocation(
          UpsertLocationRequest(
            defaultMondayAvailability:
                state.value!.availabilityRanges[0].availabilityRanges,
            defaultTuesdayAvailability:
                state.value!.availabilityRanges[1].availabilityRanges,
            defaultWednesdayAvailability:
                state.value!.availabilityRanges[2].availabilityRanges,
            defaultThursdayAvailability:
                state.value!.availabilityRanges[3].availabilityRanges,
            defaultFridayAvailability:
                state.value!.availabilityRanges[4].availabilityRanges,
            defaultSaturdayAvailability:
                state.value!.availabilityRanges[5].availabilityRanges,
            defaultSundayAvailability:
                state.value!.availabilityRanges[6].availabilityRanges,
            tz: state.value!.tz,
          ),
        );
  }

  void updateRange(int dayIndex, List<AvailabilityRange> availabilityRanges) {
    state = AsyncValue.data(
      state.value!.copyWith(
        availabilityRanges: [
          for (final (i, availabilityDay)
              in state.value!.availabilityRanges.indexed)
            if (i == dayIndex)
              availabilityDay.copyWith(
                availabilityRanges: [...availabilityRanges],
              )
            else
              availabilityDay
        ],
      ),
    );
  }

  void toggle(int dayIndex) {
    state = AsyncValue.data(
      state.value!.copyWith(
        availabilityRanges: [
          for (final (i, availabilityDay)
              in state.value!.availabilityRanges.indexed)
            if (i == dayIndex)
              availabilityDay.copyWith(
                enabled: !availabilityDay.enabled,
              )
            else
              availabilityDay
        ],
      ),
    );
  }

  void addRange(int dayIndex) {
    state = AsyncValue.data(
      state.value!.copyWith(
        availabilityRanges: [
          for (final (i, availabilityDay)
              in state.value!.availabilityRanges.indexed)
            if (i == dayIndex)
              availabilityDay.copyWith(
                availabilityRanges: [
                  ...availabilityDay.availabilityRanges,
                  AvailabilityRange(
                      startAtUnix: indexToEpoch(270),
                      endAtUnix: indexToEpoch(280))
                ],
              )
            else
              availabilityDay
        ],
      ),
    );
  }
}
