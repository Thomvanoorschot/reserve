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
    {'1': 'availabilityRanges', '3': 4, '4': 3, '5': 11, '6': '.proto.AvailabilityRange', '10': 'availabilityRanges'},
  ],
};

/// Descriptor for `UpsertLocationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertLocationRequestDescriptor = $convert.base64Decode(
    'ChVVcHNlcnRMb2NhdGlvblJlcXVlc3QSGAoCaWQYASABKAlCCLpIBXIDsAEBUgJpZBISCgRuYW'
    '1lGAIgASgJUgRuYW1lEg4KAnR6GAMgASgJUgJ0ehJIChJhdmFpbGFiaWxpdHlSYW5nZXMYBCAD'
    'KAsyGC5wcm90by5BdmFpbGFiaWxpdHlSYW5nZVISYXZhaWxhYmlsaXR5UmFuZ2Vz');

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

