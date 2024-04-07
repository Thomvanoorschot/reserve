import 'package:flutter/material.dart';
import 'package:frontend/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class LocationOverviewScreen extends StatelessWidget {
  const LocationOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () => context.goNamed(AppRoute.locationCreate.name, pathParameters: {}),
                child: const SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text("Add location")),
                ),
              ),
            );
          }),
    );
  }
}
