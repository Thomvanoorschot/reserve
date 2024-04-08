import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/repositories/grpc_client.dart';
import 'package:frontend/src/widgets/availability/week_schedule.dart';

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
