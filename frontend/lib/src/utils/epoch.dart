import 'package:fixnum/fixnum.dart';
import 'package:intl/intl.dart';

Int64 indexToEpoch(int index){
  return Int64((DateTime.fromMicrosecondsSinceEpoch(0)
      .add(Duration(
      minutes: (5.0 * index) as int))
      .millisecondsSinceEpoch /
      1000) as int);
}

final f = DateFormat('HH:mm');

String rangeDoubleToHourMinute(double index){
  return f.format(DateTime.fromMicrosecondsSinceEpoch(0).add(Duration(minutes: (5.0 * index) as int)));
}