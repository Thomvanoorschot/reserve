//
//  Generated code. Do not modify.
//  source: availability.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getAvailableDaysRequestDescriptor instead')
const GetAvailableDaysRequest$json = {
  '1': 'GetAvailableDaysRequest',
  '2': [
    {'1': 'locationId', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'locationId'},
    {'1': 'startAtUnix', '3': 2, '4': 1, '5': 3, '8': {}, '10': 'startAtUnix'},
    {'1': 'endAtUnix', '3': 3, '4': 1, '5': 3, '8': {}, '10': 'endAtUnix'},
    {'1': 'tz', '3': 4, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetAvailableDaysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableDaysRequestDescriptor = $convert.base64Decode(
    'ChdHZXRBdmFpbGFibGVEYXlzUmVxdWVzdBIoCgpsb2NhdGlvbklkGAEgASgJQgi6SAVyA7ABAV'
    'IKbG9jYXRpb25JZBIpCgtzdGFydEF0VW5peBgCIAEoA0IHukgEIgIgAFILc3RhcnRBdFVuaXgS'
    'JQoJZW5kQXRVbml4GAMgASgDQge6SAQiAiAAUgllbmRBdFVuaXgSDgoCdHoYBCABKAlSAnR6');

@$core.Deprecated('Use getAvailableDaysResponseDescriptor instead')
const GetAvailableDaysResponse$json = {
  '1': 'GetAvailableDaysResponse',
  '2': [
    {'1': 'availableDaysUnix', '3': 1, '4': 3, '5': 3, '10': 'availableDaysUnix'},
    {'1': 'tz', '3': 2, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetAvailableDaysResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableDaysResponseDescriptor = $convert.base64Decode(
    'ChhHZXRBdmFpbGFibGVEYXlzUmVzcG9uc2USLAoRYXZhaWxhYmxlRGF5c1VuaXgYASADKANSEW'
    'F2YWlsYWJsZURheXNVbml4Eg4KAnR6GAIgASgJUgJ0eg==');

@$core.Deprecated('Use getAvailableTimeslotsRequestDescriptor instead')
const GetAvailableTimeslotsRequest$json = {
  '1': 'GetAvailableTimeslotsRequest',
  '2': [
    {'1': 'locationId', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'locationId'},
    {'1': 'dayUnix', '3': 2, '4': 1, '5': 3, '8': {}, '10': 'dayUnix'},
    {'1': 'tz', '3': 3, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetAvailableTimeslotsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableTimeslotsRequestDescriptor = $convert.base64Decode(
    'ChxHZXRBdmFpbGFibGVUaW1lc2xvdHNSZXF1ZXN0EigKCmxvY2F0aW9uSWQYASABKAlCCLpIBX'
    'IDsAEBUgpsb2NhdGlvbklkEiEKB2RheVVuaXgYAiABKANCB7pIBCICIABSB2RheVVuaXgSDgoC'
    'dHoYAyABKAlSAnR6');

@$core.Deprecated('Use getAvailableTimeslotsResponseDescriptor instead')
const GetAvailableTimeslotsResponse$json = {
  '1': 'GetAvailableTimeslotsResponse',
  '2': [
    {'1': 'startTimesUnix', '3': 1, '4': 3, '5': 3, '10': 'startTimesUnix'},
    {'1': 'tz', '3': 2, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetAvailableTimeslotsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAvailableTimeslotsResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRBdmFpbGFibGVUaW1lc2xvdHNSZXNwb25zZRImCg5zdGFydFRpbWVzVW5peBgBIAMoA1'
    'IOc3RhcnRUaW1lc1VuaXgSDgoCdHoYAiABKAlSAnR6');

@$core.Deprecated('Use availabilityRangeDescriptor instead')
const AvailabilityRange$json = {
  '1': 'AvailabilityRange',
  '2': [
    {'1': 'startAtUnix', '3': 1, '4': 1, '5': 3, '10': 'startAtUnix'},
    {'1': 'endAtUnix', '3': 2, '4': 1, '5': 3, '10': 'endAtUnix'},
  ],
};

/// Descriptor for `AvailabilityRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availabilityRangeDescriptor = $convert.base64Decode(
    'ChFBdmFpbGFiaWxpdHlSYW5nZRIgCgtzdGFydEF0VW5peBgBIAEoA1ILc3RhcnRBdFVuaXgSHA'
    'oJZW5kQXRVbml4GAIgASgDUgllbmRBdFVuaXg=');

@$core.Deprecated('Use upsertAvailabilityOverrideRequestDescriptor instead')
const UpsertAvailabilityOverrideRequest$json = {
  '1': 'UpsertAvailabilityOverrideRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
    {'1': 'resourceId', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'resourceId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'startAtUnix', '3': 5, '4': 1, '5': 3, '10': 'startAtUnix'},
    {'1': 'endAtUnix', '3': 6, '4': 1, '5': 3, '10': 'endAtUnix'},
    {'1': 'availabilityId', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'availabilityId'},
    {'1': 'availabilityRanges', '3': 8, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'availabilityRanges'},
  ],
};

/// Descriptor for `UpsertAvailabilityOverrideRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertAvailabilityOverrideRequestDescriptor = $convert.base64Decode(
    'CiFVcHNlcnRBdmFpbGFiaWxpdHlPdmVycmlkZVJlcXVlc3QSGAoCaWQYASABKAlCCLpIBXIDsA'
    'EBUgJpZBIoCgpyZXNvdXJjZUlkGAIgASgJQgi6SAVyA7ABAVIKcmVzb3VyY2VJZBISCgRuYW1l'
    'GAQgASgJUgRuYW1lEiAKC3N0YXJ0QXRVbml4GAUgASgDUgtzdGFydEF0VW5peBIcCgllbmRBdF'
    'VuaXgYBiABKANSCWVuZEF0VW5peBIwCg5hdmFpbGFiaWxpdHlJZBgHIAEoCUIIukgFcgOwAQFS'
    'DmF2YWlsYWJpbGl0eUlkEkgKEmF2YWlsYWJpbGl0eVJhbmdlcxgIIAMoCzIYLnByb3RvLkF2YW'
    'lsYWJpbGl0eVJhbmdlUhJhdmFpbGFiaWxpdHlSYW5nZXM=');

@$core.Deprecated('Use upsertAvailabilityOverrideResponseDescriptor instead')
const UpsertAvailabilityOverrideResponse$json = {
  '1': 'UpsertAvailabilityOverrideResponse',
};

/// Descriptor for `UpsertAvailabilityOverrideResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertAvailabilityOverrideResponseDescriptor = $convert.base64Decode(
    'CiJVcHNlcnRBdmFpbGFiaWxpdHlPdmVycmlkZVJlc3BvbnNl');

@$core.Deprecated('Use testDescriptor instead')
const Test$json = {
  '1': 'Test',
  '2': [
    {'1': 'availability', '3': 1, '4': 3, '5': 11, '6': '.proto.Test.AvailabilityEntry', '10': 'availability'},
  ],
  '3': [Test_AvailabilityEntry$json],
};

@$core.Deprecated('Use testDescriptor instead')
const Test_AvailabilityEntry$json = {
  '1': 'AvailabilityEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.TestSlice', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Test`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testDescriptor = $convert.base64Decode(
    'CgRUZXN0EkEKDGF2YWlsYWJpbGl0eRgBIAMoCzIdLnByb3RvLlRlc3QuQXZhaWxhYmlsaXR5RW'
    '50cnlSDGF2YWlsYWJpbGl0eRpRChFBdmFpbGFiaWxpdHlFbnRyeRIQCgNrZXkYASABKANSA2tl'
    'eRImCgV2YWx1ZRgCIAEoCzIQLnByb3RvLlRlc3RTbGljZVIFdmFsdWU6AjgB');

@$core.Deprecated('Use testSliceDescriptor instead')
const TestSlice$json = {
  '1': 'TestSlice',
  '2': [
    {'1': 'startTimeUnix', '3': 1, '4': 3, '5': 3, '10': 'startTimeUnix'},
  ],
};

/// Descriptor for `TestSlice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testSliceDescriptor = $convert.base64Decode(
    'CglUZXN0U2xpY2USJAoNc3RhcnRUaW1lVW5peBgBIAMoA1INc3RhcnRUaW1lVW5peA==');

