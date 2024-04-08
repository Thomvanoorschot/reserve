import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/providers/location.dart';
import 'package:frontend/src/utils/epoch.dart';
import 'package:frontend/src/widgets/availability/week_day_schedule.dart';

class WeekSchedule extends ConsumerWidget {
  const WeekSchedule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(locationProvider.notifier);
    final availabilityDays = ref.watch(locationProvider).availabilityRanges;

    return ListView.builder(
      itemCount: availabilityDays.length,
      itemBuilder: (context, index) {
        var doubleValues = List<double>.empty(growable: true);
        availabilityDays[index].availabilityRanges.forEach((element) {
          doubleValues.add(element.startAtUnix.toDouble() /  (5.0 * 60.0));
          doubleValues.add(element.endAtUnix.toDouble() /  (5.0 * 60.0));
        });
        return WeekDaySchedule(
          weekDay: availabilityDays[index].name,
          values: doubleValues,
          onChanged: (value) {
            var availabilityRanges =
                List<AvailabilityRange>.empty(growable: true);
            for (int availabilityIndex = 0;
                availabilityIndex < value.length;
                availabilityIndex += 2) {
              availabilityRanges.add(
                AvailabilityRange(
                  startAtUnix: indexToEpoch(value[availabilityIndex].toInt()),
                  endAtUnix: indexToEpoch(value[availabilityIndex + 1].toInt()),
                ),
              );
            }

            notifier.updateRange(index, availabilityRanges);
          },
          enabled: availabilityDays[index].enabled,
          onToggle: (value) =>  notifier.toggle(index),
          addAvailabilityRange: () => notifier.addRange(index),
        );
      },
    );
  }
}
