//
//  Generated code. Do not modify.
//  source: reservation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use upsertReservationRequestDescriptor instead')
const UpsertReservationRequest$json = {
  '1': 'UpsertReservationRequest',
  '2': [
    {'1': 'reservationId', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'reservationId'},
    {'1': 'resourceId', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'resourceId'},
    {'1': 'startAtUnix', '3': 3, '4': 1, '5': 3, '10': 'startAtUnix'},
    {'1': 'endAtUnix', '3': 4, '4': 1, '5': 3, '10': 'endAtUnix'},
  ],
};

/// Descriptor for `UpsertReservationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertReservationRequestDescriptor = $convert.base64Decode(
    'ChhVcHNlcnRSZXNlcnZhdGlvblJlcXVlc3QSLgoNcmVzZXJ2YXRpb25JZBgBIAEoCUIIukgFcg'
    'OwAQFSDXJlc2VydmF0aW9uSWQSKAoKcmVzb3VyY2VJZBgCIAEoCUIIukgFcgOwAQFSCnJlc291'
    'cmNlSWQSIAoLc3RhcnRBdFVuaXgYAyABKANSC3N0YXJ0QXRVbml4EhwKCWVuZEF0VW5peBgEIA'
    'EoA1IJZW5kQXRVbml4');

@$core.Deprecated('Use upsertReservationResponseDescriptor instead')
const UpsertReservationResponse$json = {
  '1': 'UpsertReservationResponse',
  '2': [
    {'1': 'reservationId', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'reservationId'},
    {'1': 'reservedUntilUnix', '3': 2, '4': 1, '5': 3, '10': 'reservedUntilUnix'},
  ],
};

/// Descriptor for `UpsertReservationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertReservationResponseDescriptor = $convert.base64Decode(
    'ChlVcHNlcnRSZXNlcnZhdGlvblJlc3BvbnNlEi4KDXJlc2VydmF0aW9uSWQYASABKAlCCLpIBX'
    'IDsAEBUg1yZXNlcnZhdGlvbklkEiwKEXJlc2VydmVkVW50aWxVbml4GAIgASgDUhFyZXNlcnZl'
    'ZFVudGlsVW5peA==');

