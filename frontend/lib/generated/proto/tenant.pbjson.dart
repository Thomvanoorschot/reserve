//
//  Generated code. Do not modify.
//  source: tenant.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use registerTenantRequestDescriptor instead')
const RegisterTenantRequest$json = {
  '1': 'RegisterTenantRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'name'},
    {'1': 'location', '3': 2, '4': 1, '5': 9, '10': 'location'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'email'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterTenantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerTenantRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlclRlbmFudFJlcXVlc3QSGwoEbmFtZRgBIAEoCUIHukgEcgIQAVIEbmFtZRIaCg'
    'hsb2NhdGlvbhgCIAEoCVIIbG9jYXRpb24SHQoFZW1haWwYAyABKAlCB7pIBHICYAFSBWVtYWls'
    'EhoKCHBhc3N3b3JkGAQgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use registerTenantResponseDescriptor instead')
const RegisterTenantResponse$json = {
  '1': 'RegisterTenantResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `RegisterTenantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerTenantResponseDescriptor = $convert.base64Decode(
    'ChZSZWdpc3RlclRlbmFudFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEhQKBWVycm'
    '9yGAIgASgJUgVlcnJvcg==');

