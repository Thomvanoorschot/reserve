import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/screens/location/location_create_screen.dart';
import 'package:frontend/src/utils/consts.dart';
import 'package:frontend/src/widgets/availability/week_day_schedule.dart';
import 'package:intl/intl.dart';

class WeekSchedule extends ConsumerWidget {
  const WeekSchedule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(availabilityDaysProvider.notifier);
    final availabilityDays = ref.watch(availabilityDaysProvider);
    // final test = ref.watch(createLocationProvider);
    // final test2 = ref.watch(createLocationProvider).availabilityDays[0].availabilityRanges[0].startAtUnix;
    var now = DateTime.now();
    var startOfDay = DateTime(now.year, now.month, now.day);
    final f = DateFormat('HH:mm');

    return ListView.builder(
      itemCount: availabilityDays.length,
      itemBuilder: (context, index) {
        var doubleValues = List<double>.empty(growable: true);
        doubleValues.add(availabilityDays[index]
                .availabilityRanges[0]
                .startAtUnix
                .toDouble() /
            (5.0 * 60.0));
        doubleValues.add(
            availabilityDays[index].availabilityRanges[0].endAtUnix.toDouble() /
                (5.0 * 60.0));

        return WeekDaySchedule(
          weekDay: availabilityDays[index].name,
          values: doubleValues,
          onChanged: (value) {
            print(value);
            var availabilityRanges =
                List<AvailabilityRange>.empty(growable: true);
            for (int availabilityIndex = 0;
                availabilityIndex < value.length;
                availabilityIndex += 2) {
              availabilityRanges.add(
                AvailabilityRange(
                    startAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
                            .add(Duration(
                                minutes:
                                    (5.0 * value[availabilityIndex]) as int))
                            .millisecondsSinceEpoch /
                        1000) as int),
                    endAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
                            .add(Duration(
                                minutes: (5.0 * value[availabilityIndex + 1])
                                    as int))
                            .millisecondsSinceEpoch /
                        1000) as int)),
              );
            }

            notifier.updateRange(index, availabilityRanges);
          },
          // () => provider.availabilityDays[index].availabilityRanges = value,
          enabled: availabilityDays[index].enabled,
          // onToggle: (value) => setState(
          //   () {
          //     availabilityDays[index].enabled = value;
          //   },
          // ),
          startOfDay: startOfDay,
          // addAvailabilityRange: () => setState(
          //   () {
          //     // provider.availabilityDays[index].availabilityRanges.addAll(
          //     //   [segmentsInDay, segmentsInDay],
          //     // );
          //   },
          // ),
          onToggle: (value) {},
          addAvailabilityRange: () {},
        );
      },
    );
  }
}
