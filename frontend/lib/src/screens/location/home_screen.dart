import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/generated/proto/availability.pb.dart';
import 'package:frontend/src/repositories/grpc_client.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availabilityService = ref.watch(availabilityServiceProvider);

    bool _isAvailable(DateTime day, GetAvailableDaysResponse availableDays) {
      bool isAvailable = false;
      availableDays.availableDaysUnix.forEach((element) {
        if(day.millisecondsSinceEpoch / 1000 as int == element.toInt()){
          isAvailable = true;
        }
      });

      return isAvailable;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Test"),
      ),
      body: FutureBuilder<GetAvailableDaysResponse>(
          future: availabilityService.getAvailableDays(
            GetAvailableDaysRequest(
              locationId: "b3b41d5e-27b9-40bb-9458-32b169693d5d",
              startAtUnix: Int64(1711234800),
              endAtUnix: Int64(1713909600),
              tz: "Europe/Amsterdam",
            ),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CalendarDatePicker(
                      onDateChanged: (DateTime value) {},
                      lastDate: DateTime.now().add(Duration(days: 60)),
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      selectableDayPredicate: (day) {
                        return _isAvailable(day, snapshot.data!);
                      },
                    ),
                  ),
                ],
              );
            }
            return const Text("Waiting");
          }),
    );
  }
}
