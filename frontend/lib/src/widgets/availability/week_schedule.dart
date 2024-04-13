import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/providers/location.dart';
import 'package:frontend/src/utils/epoch.dart';
import 'package:frontend/src/widgets/availability/week_day_schedule.dart';

class WeekSchedule extends ConsumerWidget {
  const WeekSchedule({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(locationProvider(id).notifier);
    // final availabilityDays = ref.watch(locationProvider(id)).value!.availabilityRanges;

    final location = ref.watch(locationProvider(id));
    return switch (location) {
      AsyncData(:final value) => ListView.builder(
          itemCount: value.availabilityRanges.length,
          itemBuilder: (context, index) {
            var doubleValues = List<double>.empty(growable: true);
            for (var element
                in value.availabilityRanges[index].availabilityRanges) {
              doubleValues.add(element.startAtUnix.toDouble() / (5.0 * 60.0));
              doubleValues.add(element.endAtUnix.toDouble() / (5.0 * 60.0));
            }
            return WeekDaySchedule(
              weekDay: value.availabilityRanges[index].name,
              values: doubleValues,
              onChanged: (value) {
                var availabilityRanges =
                    List<AvailabilityRange>.empty(growable: true);
                for (int availabilityIndex = 0;
                    availabilityIndex < value.length;
                    availabilityIndex += 2) {
                  availabilityRanges.add(
                    AvailabilityRange(
                      startAtUnix:
                          indexToEpoch(value[availabilityIndex].toInt()),
                      endAtUnix:
                          indexToEpoch(value[availabilityIndex + 1].toInt()),
                    ),
                  );
                }
                notifier.updateRange(index, availabilityRanges);
              },
              enabled: value.availabilityRanges[index].enabled,
              onToggle: (value) => notifier.toggle(index),
              addAvailabilityRange: () => notifier.addRange(index),
            );
          },
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
