import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';
import 'package:frontend/src/utils/consts.dart';
import 'package:frontend/src/utils/epoch.dart';

class WeekDaySchedule extends StatelessWidget {
  const WeekDaySchedule({
    required this.values,
    required this.weekDay,
    required this.onChanged,
    required this.onToggle,
    required this.enabled,
    required this.addAvailabilityRange,
    super.key,
  });

  final List<double> values;
  final String weekDay;
  final ValueChanged<List<double>> onChanged;
  final ValueChanged<bool> onToggle;
  final VoidCallback addAvailabilityRange;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    const chartTextFont = TextStyle(fontSize: 12);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    weekDay,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: addAvailabilityRange,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Icon(Icons.add),
                ),
                Switch(value: enabled, onChanged: onToggle),
              ],
            ),
          ),
          MultiSlider(
            values: values,
            onChanged: enabled ? onChanged : null,
            divisions: segmentsInDay as int,
            min: 0,
            max: segmentsInDay,
            textHeightOffset: 1000,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0h', style: chartTextFont),
                Text('6h', style: chartTextFont),
                Text('12h', style: chartTextFont),
                Text('18h', style: chartTextFont),
                Text('24h', style: chartTextFont),
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (enabled) ...[
            for (int index = 0; index < values.length; index += 2)
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 2),
                child: Text(
                  'Availability ${index ~/ 2 + 1} starts at ${rangeDoubleToHourMinute(values[index])} '
                      'and ends at  ${rangeDoubleToHourMinute(values[index + 1])}.',
                ),
              ),
          ] else
            const Padding(
              padding: EdgeInsets.only(left: 8, bottom: 2),
              child: Text('No availability today.'),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
