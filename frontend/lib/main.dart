import 'package:flutter/material.dart';
import 'package:frontend/generated/proto/main.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

import 'generated/proto/availability.pb.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AvailabilityServiceClient? _availabilityServiceClient;
  late Future<GetAvailableDaysResponse> availableDays;

  @override
  void initState() {
    super.initState();
    final test = GrpcOrGrpcWebClientChannel.toSeparatePorts(
      host: '192.168.1.94',
      grpcPort: 8080,
      grpcWebPort: 8081,
      grpcTransportSecure: false,
      grpcWebTransportSecure: false,
    );

    _availabilityServiceClient = AvailabilityServiceClient(test);
    availableDays = _getAvailableDays();
  }

  var subtext = 'You have pushed the button this many times:';

  Future<GetAvailableDaysResponse> _getAvailableDays() async {
    return await _availabilityServiceClient!.getAvailableDays(
      GetAvailableDaysRequest(
        locationId: "b3b41d5e-27b9-40bb-9458-32b169693d5d",
        startAtUnix: $fixnum.Int64(1711234800),
        endAtUnix: $fixnum.Int64(1713909600),
        tz: "Europe/Amsterdam",
      ),
    );
  }

  bool _isAvailable(DateTime day, GetAvailableDaysResponse availableDays) {
    bool isAvailable = false;
    availableDays.availableDaysUnix.forEach((element) {
      if (day.millisecondsSinceEpoch / 1000 as int == element.toInt()) {
        isAvailable = true;
      }
    });

    return isAvailable;
  }

  var test = DatePickerDialog(
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 31)),
    selectableDayPredicate: (day) {
      return _isAvailable(day, snapshot.data!);
    },
    initialDate: DateTime.now(),
    // onDateChanged: (date){},
  );

  aaaa(){
    test.
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<GetAvailableDaysResponse>(
          future: availableDays,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  // Container(
                  //   width: 300,
                  //   height: 300,
                  //   child:
                    DatePickerDialog(
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 31)),
                      selectableDayPredicate: (day) {
                        return _isAvailable(day, snapshot.data!);
                      },
                      initialDate: DateTime.now(),
                      // onDateChanged: (date){},
                    ),
                  // ),
                ],
              );
            }
            return const Text("Waiting");
          }),
    );
  }
}
