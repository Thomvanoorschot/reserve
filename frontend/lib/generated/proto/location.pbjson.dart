//
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use upsertLocationRequestDescriptor instead')
const UpsertLocationRequest$json = {
  '1': 'UpsertLocationRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'tz', '3': 3, '4': 1, '5': 9, '10': 'tz'},
    {'1': 'DefaultMondayAvailability', '3': 4, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultMondayAvailability'},
    {'1': 'DefaultTuesdayAvailability', '3': 5, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultTuesdayAvailability'},
    {'1': 'DefaultWednesdayAvailability', '3': 6, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultWednesdayAvailability'},
    {'1': 'DefaultThursdayAvailability', '3': 7, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultThursdayAvailability'},
    {'1': 'DefaultFridayAvailability', '3': 8, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultFridayAvailability'},
    {'1': 'DefaultSaturdayAvailability', '3': 9, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultSaturdayAvailability'},
    {'1': 'DefaultSundayAvailability', '3': 10, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'DefaultSundayAvailability'},
  ],
};

/// Descriptor for `UpsertLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertLocationRequestDescriptor = $convert.base64Decode(
    'ChVVcHNlcnRMb2NhdGlvblJlcXVlc3QSGAoCaWQYASABKAlCCLpIBXIDsAEBUgJpZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEg4KAnR6GAMgASgJUgJ0ehJWChlEZWZhdWx0TW9uZGF5QXZhaWxhYmls'
    'aXR5GAQgAygLMhgucHJvdG8uQXZhaWxhYmlsaXR5UmFuZ2VSGURlZmF1bHRNb25kYXlBdmFpbG'
    'FiaWxpdHkSWAoaRGVmYXVsdFR1ZXNkYXlBdmFpbGFiaWxpdHkYBSADKAsyGC5wcm90by5BdmFp'
    'bGFiaWxpdHlSYW5nZVIaRGVmYXVsdFR1ZXNkYXlBdmFpbGFiaWxpdHkSXAocRGVmYXVsdFdlZG'
    '5lc2RheUF2YWlsYWJpbGl0eRgGIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhxEZWZh'
    'dWx0V2VkbmVzZGF5QXZhaWxhYmlsaXR5EloKG0RlZmF1bHRUaHVyc2RheUF2YWlsYWJpbGl0eR'
    'gHIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhtEZWZhdWx0VGh1cnNkYXlBdmFpbGFi'
    'aWxpdHkSVgoZRGVmYXVsdEZyaWRheUF2YWlsYWJpbGl0eRgIIAMoCzIYLnByb3RvLkF2YWlsYW'
    'JpbGl0eVJhbmdlUhlEZWZhdWx0RnJpZGF5QXZhaWxhYmlsaXR5EloKG0RlZmF1bHRTYXR1cmRh'
    'eUF2YWlsYWJpbGl0eRgJIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhtEZWZhdWx0U2'
    'F0dXJkYXlBdmFpbGFiaWxpdHkSVgoZRGVmYXVsdFN1bmRheUF2YWlsYWJpbGl0eRgKIAMoCzIY'
    'LnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhlEZWZhdWx0U3VuZGF5QXZhaWxhYmlsaXR5');

@$core.Deprecated('Use upsertLocationResponseDescriptor instead')
const UpsertLocationResponse$json = {
  '1': 'UpsertLocationResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UpsertLocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertLocationResponseDescriptor = $convert.base64Decode(
    'ChZVcHNlcnRMb2NhdGlvblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZA==');

