import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationCreateScreen extends ConsumerWidget {
  const LocationCreateScreen({super.key});

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

        ],
      ),
    );
  }
}