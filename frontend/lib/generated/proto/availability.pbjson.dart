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

@$core.Deprecated('Use getStartTimesRequestDescriptor instead')
const GetStartTimesRequest$json = {
  '1': 'GetStartTimesRequest',
  '2': [
    {'1': 'locationId', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'locationId'},
    {'1': 'startAt', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startAt'},
    {'1': 'endAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endAt'},
    {'1': 'tz', '3': 4, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetStartTimesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStartTimesRequestDescriptor = $convert.base64Decode(
    'ChRHZXRTdGFydFRpbWVzUmVxdWVzdBIoCgpsb2NhdGlvbklkGAEgASgJQgi6SAVyA7ABAVIKbG'
    '9jYXRpb25JZBI0CgdzdGFydEF0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIH'
    'c3RhcnRBdBIwCgVlbmRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBWVuZE'
    'F0Eg4KAnR6GAQgASgJUgJ0eg==');

@$core.Deprecated('Use getStartTimesResponseDescriptor instead')
const GetStartTimesResponse$json = {
  '1': 'GetStartTimesResponse',
  '2': [
    {'1': 'startTimes', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTimes'},
    {'1': 'tz', '3': 2, '4': 1, '5': 9, '10': 'tz'},
  ],
};

/// Descriptor for `GetStartTimesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStartTimesResponseDescriptor = $convert.base64Decode(
    'ChVHZXRTdGFydFRpbWVzUmVzcG9uc2USOgoKc3RhcnRUaW1lcxgBIAMoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCnN0YXJ0VGltZXMSDgoCdHoYAiABKAlSAnR6');

@$core.Deprecated('Use availabilityRangeDescriptor instead')
const AvailabilityRange$json = {
  '1': 'AvailabilityRange',
  '2': [
    {'1': 'startAt', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startAt'},
    {'1': 'endAt', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endAt'},
  ],
};

/// Descriptor for `AvailabilityRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availabilityRangeDescriptor = $convert.base64Decode(
    'ChFBdmFpbGFiaWxpdHlSYW5nZRI0CgdzdGFydEF0GAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcFIHc3RhcnRBdBIwCgVlbmRBdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSBWVuZEF0');

@$core.Deprecated('Use upsertAvailabilityOverrideRequestDescriptor instead')
const UpsertAvailabilityOverrideRequest$json = {
  '1': 'UpsertAvailabilityOverrideRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
    {'1': 'resourceId', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'resourceId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'startAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startAt'},
    {'1': 'endAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endAt'},
    {'1': 'availabilityId', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'availabilityId'},
    {'1': 'availabilityRanges', '3': 8, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'availabilityRanges'},
  ],
};

/// Descriptor for `UpsertAvailabilityOverrideRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertAvailabilityOverrideRequestDescriptor = $convert.base64Decode(
    'CiFVcHNlcnRBdmFpbGFiaWxpdHlPdmVycmlkZVJlcXVlc3QSGAoCaWQYASABKAlCCLpIBXIDsA'
    'EBUgJpZBIoCgpyZXNvdXJjZUlkGAIgASgJQgi6SAVyA7ABAVIKcmVzb3VyY2VJZBISCgRuYW1l'
    'GAQgASgJUgRuYW1lEjQKB3N0YXJ0QXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wUgdzdGFydEF0EjAKBWVuZEF0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIF'
    'ZW5kQXQSMAoOYXZhaWxhYmlsaXR5SWQYByABKAlCCLpIBXIDsAEBUg5hdmFpbGFiaWxpdHlJZB'
    'JIChJhdmFpbGFiaWxpdHlSYW5nZXMYCCADKAsyGC5wcm90by5BdmFpbGFiaWxpdHlSYW5nZVIS'
    'YXZhaWxhYmlsaXR5UmFuZ2Vz');

@$core.Deprecated('Use upsertAvailabilityOverrideResponseDescriptor instead')
const UpsertAvailabilityOverrideResponse$json = {
  '1': 'UpsertAvailabilityOverrideResponse',
};

/// Descriptor for `UpsertAvailabilityOverrideResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertAvailabilityOverrideResponseDescriptor = $convert.base64Decode(
    'CiJVcHNlcnRBdmFpbGFiaWxpdHlPdmVycmlkZVJlc3BvbnNl');

