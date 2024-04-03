import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationOverviewScreen extends ConsumerWidget {
  const LocationOverviewScreen({super.key});

  static const pageSize = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final query = ref.watch(moviesSearchTextProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: Column(
        children: [
          Flexible(
            child: Column(
              children: [for (int i = 0; i < 7; i++) const DayRange()],
            ),
          ),
          Flexible(child: Text('data'))
        ],
      ),
    );
  }
}

class DayRange extends StatelessWidget {
  const DayRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
