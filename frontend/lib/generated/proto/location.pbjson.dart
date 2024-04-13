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

@$core.Deprecated('Use getLocationByIDRequestDescriptor instead')
const GetLocationByIDRequest$json = {
  '1': 'GetLocationByIDRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'id'},
  ],
};

/// Descriptor for `GetLocationByIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationByIDRequestDescriptor = $convert.base64Decode(
    'ChZHZXRMb2NhdGlvbkJ5SURSZXF1ZXN0EhgKAmlkGAEgASgJQgi6SAVyA7ABAVICaWQ=');

@$core.Deprecated('Use getLocationsRequestDescriptor instead')
const GetLocationsRequest$json = {
  '1': 'GetLocationsRequest',
};

/// Descriptor for `GetLocationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsRequestDescriptor = $convert.base64Decode(
    'ChNHZXRMb2NhdGlvbnNSZXF1ZXN0');

@$core.Deprecated('Use getLocationsResponseDescriptor instead')
const GetLocationsResponse$json = {
  '1': 'GetLocationsResponse',
  '2': [
    {'1': 'locations', '3': 1, '4': 3, '5': 11, '6': '.proto.LocationResponse', '10': 'locations'},
  ],
};

/// Descriptor for `GetLocationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLocationsResponseDescriptor = $convert.base64Decode(
    'ChRHZXRMb2NhdGlvbnNSZXNwb25zZRI1Cglsb2NhdGlvbnMYASADKAsyFy5wcm90by5Mb2NhdG'
    'lvblJlc3BvbnNlUglsb2NhdGlvbnM=');

@$core.Deprecated('Use locationResponseDescriptor instead')
const LocationResponse$json = {
  '1': 'LocationResponse',
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

/// Descriptor for `LocationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationResponseDescriptor = $convert.base64Decode(
    'ChBMb2NhdGlvblJlc3BvbnNlEhgKAmlkGAEgASgJQgi6SAVyA7ABAVICaWQSEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIOCgJ0ehgDIAEoCVICdHoSVgoZRGVmYXVsdE1vbmRheUF2YWlsYWJpbGl0eRgE'
    'IAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhlEZWZhdWx0TW9uZGF5QXZhaWxhYmlsaX'
    'R5ElgKGkRlZmF1bHRUdWVzZGF5QXZhaWxhYmlsaXR5GAUgAygLMhgucHJvdG8uQXZhaWxhYmls'
    'aXR5UmFuZ2VSGkRlZmF1bHRUdWVzZGF5QXZhaWxhYmlsaXR5ElwKHERlZmF1bHRXZWRuZXNkYX'
    'lBdmFpbGFiaWxpdHkYBiADKAsyGC5wcm90by5BdmFpbGFiaWxpdHlSYW5nZVIcRGVmYXVsdFdl'
    'ZG5lc2RheUF2YWlsYWJpbGl0eRJaChtEZWZhdWx0VGh1cnNkYXlBdmFpbGFiaWxpdHkYByADKA'
    'syGC5wcm90by5BdmFpbGFiaWxpdHlSYW5nZVIbRGVmYXVsdFRodXJzZGF5QXZhaWxhYmlsaXR5'
    'ElYKGURlZmF1bHRGcmlkYXlBdmFpbGFiaWxpdHkYCCADKAsyGC5wcm90by5BdmFpbGFiaWxpdH'
    'lSYW5nZVIZRGVmYXVsdEZyaWRheUF2YWlsYWJpbGl0eRJaChtEZWZhdWx0U2F0dXJkYXlBdmFp'
    'bGFiaWxpdHkYCSADKAsyGC5wcm90by5BdmFpbGFiaWxpdHlSYW5nZVIbRGVmYXVsdFNhdHVyZG'
    'F5QXZhaWxhYmlsaXR5ElYKGURlZmF1bHRTdW5kYXlBdmFpbGFiaWxpdHkYCiADKAsyGC5wcm90'
    'by5BdmFpbGFiaWxpdHlSYW5nZVIZRGVmYXVsdFN1bmRheUF2YWlsYWJpbGl0eQ==');

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
    'ChVVcHNlcnRMb2NhdGlvblJlcXVlc3QSGwoCaWQYASABKAlCC7pICHIDsAEB0AEBUgJpZBISCg'
    'RuYW1lGAIgASgJUgRuYW1lEg4KAnR6GAMgASgJUgJ0ehJWChlEZWZhdWx0TW9uZGF5QXZhaWxh'
    'YmlsaXR5GAQgAygLMhgucHJvdG8uQXZhaWxhYmlsaXR5UmFuZ2VSGURlZmF1bHRNb25kYXlBdm'
    'FpbGFiaWxpdHkSWAoaRGVmYXVsdFR1ZXNkYXlBdmFpbGFiaWxpdHkYBSADKAsyGC5wcm90by5B'
    'dmFpbGFiaWxpdHlSYW5nZVIaRGVmYXVsdFR1ZXNkYXlBdmFpbGFiaWxpdHkSXAocRGVmYXVsdF'
    'dlZG5lc2RheUF2YWlsYWJpbGl0eRgGIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhxE'
    'ZWZhdWx0V2VkbmVzZGF5QXZhaWxhYmlsaXR5EloKG0RlZmF1bHRUaHVyc2RheUF2YWlsYWJpbG'
    'l0eRgHIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhtEZWZhdWx0VGh1cnNkYXlBdmFp'
    'bGFiaWxpdHkSVgoZRGVmYXVsdEZyaWRheUF2YWlsYWJpbGl0eRgIIAMoCzIYLnByb3RvLkF2YW'
    'lsYWJpbGl0eVJhbmdlUhlEZWZhdWx0RnJpZGF5QXZhaWxhYmlsaXR5EloKG0RlZmF1bHRTYXR1'
    'cmRheUF2YWlsYWJpbGl0eRgJIAMoCzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhtEZWZhdW'
    'x0U2F0dXJkYXlBdmFpbGFiaWxpdHkSVgoZRGVmYXVsdFN1bmRheUF2YWlsYWJpbGl0eRgKIAMo'
    'CzIYLnByb3RvLkF2YWlsYWJpbGl0eVJhbmdlUhlEZWZhdWx0U3VuZGF5QXZhaWxhYmlsaXR5');

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

