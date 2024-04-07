//
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'availability.pb.dart' as $0;

class UpsertLocationRequest extends $pb.GeneratedMessage {
  factory UpsertLocationRequest({
    $core.String? id,
    $core.String? name,
    $core.String? tz,
    $core.Iterable<$0.AvailabilityRange>? defaultMondayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultTuesdayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultWednesdayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultThursdayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultFridayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultSaturdayAvailability,
    $core.Iterable<$0.AvailabilityRange>? defaultSundayAvailability,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (tz != null) {
      $result.tz = tz;
    }
    if (defaultMondayAvailability != null) {
      $result.defaultMondayAvailability.addAll(defaultMondayAvailability);
    }
    if (defaultTuesdayAvailability != null) {
      $result.defaultTuesdayAvailability.addAll(defaultTuesdayAvailability);
    }
    if (defaultWednesdayAvailability != null) {
      $result.defaultWednesdayAvailability.addAll(defaultWednesdayAvailability);
    }
    if (defaultThursdayAvailability != null) {
      $result.defaultThursdayAvailability.addAll(defaultThursdayAvailability);
    }
    if (defaultFridayAvailability != null) {
      $result.defaultFridayAvailability.addAll(defaultFridayAvailability);
    }
    if (defaultSaturdayAvailability != null) {
      $result.defaultSaturdayAvailability.addAll(defaultSaturdayAvailability);
    }
    if (defaultSundayAvailability != null) {
      $result.defaultSundayAvailability.addAll(defaultSundayAvailability);
    }
    return $result;
  }
  UpsertLocationRequest._() : super();
  factory UpsertLocationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertLocationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertLocationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'tz')
    ..pc<$0.AvailabilityRange>(4, _omitFieldNames ? '' : 'DefaultMondayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultMondayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(5, _omitFieldNames ? '' : 'DefaultTuesdayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultTuesdayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(6, _omitFieldNames ? '' : 'DefaultWednesdayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultWednesdayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(7, _omitFieldNames ? '' : 'DefaultThursdayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultThursdayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(8, _omitFieldNames ? '' : 'DefaultFridayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultFridayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(9, _omitFieldNames ? '' : 'DefaultSaturdayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultSaturdayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..pc<$0.AvailabilityRange>(10, _omitFieldNames ? '' : 'DefaultSundayAvailability', $pb.PbFieldType.PM, protoName: 'DefaultSundayAvailability', subBuilder: $0.AvailabilityRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertLocationRequest clone() => UpsertLocationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertLocationRequest copyWith(void Function(UpsertLocationRequest) updates) => super.copyWith((message) => updates(message as UpsertLocationRequest)) as UpsertLocationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertLocationRequest create() => UpsertLocationRequest._();
  UpsertLocationRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertLocationRequest> createRepeated() => $pb.PbList<UpsertLocationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertLocationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertLocationRequest>(create);
  static UpsertLocationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tz => $_getSZ(2);
  @$pb.TagNumber(3)
  set tz($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTz() => $_has(2);
  @$pb.TagNumber(3)
  void clearTz() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$0.AvailabilityRange> get defaultMondayAvailability => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.AvailabilityRange> get defaultTuesdayAvailability => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$0.AvailabilityRange> get defaultWednesdayAvailability => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$0.AvailabilityRange> get defaultThursdayAvailability => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$0.AvailabilityRange> get defaultFridayAvailability => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$0.AvailabilityRange> get defaultSaturdayAvailability => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$0.AvailabilityRange> get defaultSundayAvailability => $_getList(9);
}

class UpsertLocationResponse extends $pb.GeneratedMessage {
  factory UpsertLocationResponse({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  UpsertLocationResponse._() : super();
  factory UpsertLocationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertLocationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertLocationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertLocationResponse clone() => UpsertLocationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertLocationResponse copyWith(void Function(UpsertLocationResponse) updates) => super.copyWith((message) => updates(message as UpsertLocationResponse)) as UpsertLocationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertLocationResponse create() => UpsertLocationResponse._();
  UpsertLocationResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertLocationResponse> createRepeated() => $pb.PbList<UpsertLocationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertLocationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertLocationResponse>(create);
  static UpsertLocationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
