
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/models/availability/availability_day_model.dart';

part 'location_model.freezed.dart';

@freezed
class LocationModel with _$LocationModel {
  factory LocationModel({
    required String id,
    required String name,
    required List<AvailabilityDayModel> availabilityRanges,
    required String tz,
  }) = _LocationModel;
}

