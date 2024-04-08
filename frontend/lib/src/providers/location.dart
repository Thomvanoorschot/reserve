import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/models/availability/availability_day_model.dart';
import 'package:frontend/src/models/location/location_model.dart';
import 'package:frontend/src/utils/epoch.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.g.dart';

@riverpod
class Location extends _$Location {
  @override
  LocationModel build() {
    return LocationModel(
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

  void updateRange(int dayIndex, List<AvailabilityRange> availabilityRanges) {
    state = state.copyWith(
      availabilityRanges: [
        for (final (i, availabilityDay) in state.availabilityRanges.indexed)
          if (i == dayIndex)
            availabilityDay.copyWith(
              availabilityRanges: [...availabilityRanges],
            )
          else
            availabilityDay
      ],
    );
  }

  void toggle(int dayIndex) {
    state = state.copyWith(
      availabilityRanges: [
        for (final (i, availabilityDay) in state.availabilityRanges.indexed)
          if (i == dayIndex)
            availabilityDay.copyWith(
              enabled: !availabilityDay.enabled,
            )
          else
            availabilityDay
      ],
    );
  }
  void addRange(int dayIndex) {
    state = state.copyWith(
      availabilityRanges: [
        for (final (i, availabilityDay) in state.availabilityRanges.indexed)
          if (i == dayIndex)
            availabilityDay.copyWith(
              availabilityRanges: [...availabilityDay.availabilityRanges, AvailabilityRange(startAtUnix: indexToEpoch(270), endAtUnix: indexToEpoch(280))],
            )
          else
            availabilityDay
      ],
    );
  }
}
