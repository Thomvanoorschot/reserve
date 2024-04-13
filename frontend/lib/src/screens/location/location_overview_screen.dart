import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/providers/locations.dart';
import 'package:frontend/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class LocationOverviewScreen extends ConsumerWidget {
  const LocationOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: switch (locations) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () => context.goNamed(
                    AppRoute.locationDetail.name,
                    pathParameters: {"id": value[index].id},
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Center(
                      child: Text(value[index].name),
                    ),
                  ),
                ),
              );
            },
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
