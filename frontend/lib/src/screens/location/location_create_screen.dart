import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/clients/grpc_client.dart';
import 'package:frontend/src/widgets/availability/week_schedule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_create_screen.freezed.dart';

part 'location_create_screen.g.dart';

@freezed
class AvailabilityDay with _$AvailabilityDay {
  factory AvailabilityDay.def({
    required String name,
    required List<AvailabilityRange> availabilityRanges,
    required bool enabled,
  }) = _AvailabilityDay;

  factory AvailabilityDay({
    required String name,
  }) {
    return _AvailabilityDay(
      name: name,
      availabilityRanges: [
        AvailabilityRange(
          startAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
                  .add(const Duration(hours: 8))
                  .millisecondsSinceEpoch /
              1000) as int),
          endAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
                  .add(const Duration(hours: 18))
                  .millisecondsSinceEpoch /
              1000) as int),
        ),
      ],
      enabled: true,
    );
  }
}

// List.from ( []
//
// AvailabilityDay(name: "Monday"),
// AvailabilityDay(name: "Tuesday"),
// AvailabilityDay(name: "Wednesday"),
// AvailabilityDay(name: "Thursday"),
// AvailabilityDay(name: "Friday"),
// AvailabilityDay(name: "Saturday"),
// AvailabilityDay(name: "Sunday")

@riverpod
class AvailabilityDays extends _$AvailabilityDays {
  @override
  List<AvailabilityDay> build() {
    return List.from(
      [
        AvailabilityDay(name: "Monday"),
        AvailabilityDay(name: "Tuesday"),
        AvailabilityDay(name: "Wednesday"),
        AvailabilityDay(name: "Thursday"),
        AvailabilityDay(name: "Friday"),
        AvailabilityDay(name: "Saturday"),
        AvailabilityDay(name: "Sunday"),
      ],
    );
  }

  void updateRange(int dayIndex, List<AvailabilityRange> availabilityRanges) {
    state = [
      for (final (i, availabilityDay) in state.indexed)
        if (i == dayIndex)
          availabilityDay.copyWith(
            availabilityRanges: [...availabilityRanges],
          )
        else
          availabilityDay
    ];
  }
}

class LocationCreateScreen extends ConsumerWidget {
  const LocationCreateScreen({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(locationServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: Column(
        children: [
          Flexible(child: WeekSchedule()),
        ],
      ),
    );
  }
}
