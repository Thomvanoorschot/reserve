import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/generated/proto/availability.pb.dart';

part 'availability_day_model.freezed.dart';

@freezed
class AvailabilityDayModel with _$AvailabilityDayModel {
  factory AvailabilityDayModel.def({
    required String name,
    required List<AvailabilityRange> availabilityRanges,
    required bool enabled,
  }) = _AvailabilityDayModel;

  factory AvailabilityDayModel({
    required String name,
  }) {
    return _AvailabilityDayModel(
      name: name,
      availabilityRanges: [
        AvailabilityRange(
          startAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
              .add(const Duration(hours: 8))
              .millisecondsSinceEpoch /
              1000) as int),
          endAtUnix: Int64((DateTime.fromMicrosecondsSinceEpoch(0)
              .add(const Duration(hours: 18))
              .millisecondsSinceEpoch /
              1000) as int),
        ),
      ],
      enabled: true,
    );
  }
}

