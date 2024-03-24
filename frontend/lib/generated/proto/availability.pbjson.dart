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

