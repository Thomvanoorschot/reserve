import 'package:flutter/material.dart';
import 'package:frontend/clients/grpc_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generated/proto/availability.pb.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availabilityService = ref.watch(availabilityServiceProvider);

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
                    child: DaysPicker(
                      minDate: DateTime.now(),
                      maxDate: DateTime.now().add(const Duration(days: 31)),
                      onDateSelected: (value) => print(value),
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
