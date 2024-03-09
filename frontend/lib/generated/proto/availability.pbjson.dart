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

@$core.Deprecated('Use upsertResourceRequestDescriptor instead')
const UpsertResourceRequest$json = {
  '1': 'UpsertResourceRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'locationId', '3': 3, '4': 1, '5': 3, '10': 'locationId'},
    {'1': 'minimumSegments', '3': 4, '4': 1, '5': 9, '10': 'minimumSegments'},
    {'1': 'maximumSegments', '3': 5, '4': 1, '5': 9, '10': 'maximumSegments'},
    {'1': 'availability', '3': 6, '4': 3, '5': 8, '10': 'availability'},
  ],
};

/// Descriptor for `UpsertResourceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertResourceRequestDescriptor = $convert.base64Decode(
    'ChVVcHNlcnRSZXNvdXJjZVJlcXVlc3QSDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSHgoKbG9jYXRpb25JZBgDIAEoA1IKbG9jYXRpb25JZBIoCg9taW5pbXVtU2VnbWVudHMY'
    'BCABKAlSD21pbmltdW1TZWdtZW50cxIoCg9tYXhpbXVtU2VnbWVudHMYBSABKAlSD21heGltdW'
    '1TZWdtZW50cxIiCgxhdmFpbGFiaWxpdHkYBiADKAhSDGF2YWlsYWJpbGl0eQ==');

@$core.Deprecated('Use upsertResourceResponseDescriptor instead')
const UpsertResourceResponse$json = {
  '1': 'UpsertResourceResponse',
};

/// Descriptor for `UpsertResourceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertResourceResponseDescriptor = $convert.base64Decode(
    'ChZVcHNlcnRSZXNvdXJjZVJlc3BvbnNl');

