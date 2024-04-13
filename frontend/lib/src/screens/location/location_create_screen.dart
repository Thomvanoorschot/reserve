import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/providers/location.dart';
import 'package:frontend/src/widgets/availability/week_schedule.dart';
import 'package:timezone/browser.dart' as tz;

Future<(Map<String, tz.Location>, tz.Location)> getLocations() async {
  await tz.initializeTimeZone();
  return (tz.timeZoneDatabase.locations, tz.getLocation("Europe/Amsterdam"));
}

class LocationCreateScreen extends ConsumerWidget {
  const LocationCreateScreen({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(locationProvider("").notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getLocations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                    enableFeedback: true,
                    value: snapshot.data!.$2,
                    items: snapshot.data!.$1
                        .map(
                          (description, value) {
                            return MapEntry(
                              description,
                              DropdownMenuItem<tz.Location>(
                                value: value,
                                child: Text(description),
                              ),
                            );
                          },
                        )
                        .values
                        .toList(),
                    onChanged: (item) {});
              }
              return DropdownButton(items: List.empty(), onChanged: (item) {});
            },
          ),
          const Flexible(
            child: WeekSchedule(id: "",),
          ),
          ElevatedButton(
            onPressed: notifier.upsertLocation,
            child: const Text("Upsert"),
          )
        ],
      ),
    );
  }
}
