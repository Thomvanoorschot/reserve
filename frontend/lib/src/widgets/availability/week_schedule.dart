import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/screens/location/location_create_screen.dart';
import 'package:frontend/src/utils/consts.dart';
import 'package:frontend/src/widgets/availability/week_day_schedule.dart';

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

    return ListView.builder(
      itemCount: availabilityDays.length,
      itemBuilder: (context, index) {

        var doubleValues = List<double>.empty(growable: true);
        doubleValues.add(availabilityDays[index].availabilityRanges[0].startAtUnix.toDouble() / (5.0 * 60.0));
        doubleValues.add(availabilityDays[index].availabilityRanges[0].endAtUnix.toDouble() / (5.0 * 60.0));

        return WeekDaySchedule(
          weekDay: availabilityDays[index].name,
          values: doubleValues,
          onChanged: (value) {
            notifier.toggle(1);
            // notifier.update((state) {
            //   // state.test = state.test +1;
            //   // print(state.test);
            //   // state.availabilityDays[index].availabilityRanges[0]
            //   //     .startAtUnix = Int64(0);
            //   // notifier.updateShouldNotify(old, current)
            //   // state.availabilityDays = [...state.availabilityDays, AvailabilityDay(name: "${state.test}")];
            //   return state;
            // });
            // notifier.state.test = 5;
            // notifier.state.availabilityDays[index].availabilityRanges[0]
            //     .startAtUnix = Int64(0);
            // setState(() {
            //
            // });
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
          onToggle: (value){},
          addAvailabilityRange: (){},
        );
      },
    );
  }
}
