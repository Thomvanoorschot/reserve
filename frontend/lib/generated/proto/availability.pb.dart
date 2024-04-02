//
//  Generated code. Do not modify.
//  source: availability.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetAvailableDaysRequest extends $pb.GeneratedMessage {
  factory GetAvailableDaysRequest({
    $core.String? locationId,
    $fixnum.Int64? startAtUnix,
    $fixnum.Int64? endAtUnix,
    $core.String? tz,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (startAtUnix != null) {
      $result.startAtUnix = startAtUnix;
    }
    if (endAtUnix != null) {
      $result.endAtUnix = endAtUnix;
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetAvailableDaysRequest._() : super();
  factory GetAvailableDaysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableDaysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableDaysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId', protoName: 'locationId')
    ..aInt64(2, _omitFieldNames ? '' : 'startAtUnix', protoName: 'startAtUnix')
    ..aInt64(3, _omitFieldNames ? '' : 'endAtUnix', protoName: 'endAtUnix')
    ..aOS(4, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableDaysRequest clone() => GetAvailableDaysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableDaysRequest copyWith(void Function(GetAvailableDaysRequest) updates) => super.copyWith((message) => updates(message as GetAvailableDaysRequest)) as GetAvailableDaysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableDaysRequest create() => GetAvailableDaysRequest._();
  GetAvailableDaysRequest createEmptyInstance() => create();
  static $pb.PbList<GetAvailableDaysRequest> createRepeated() => $pb.PbList<GetAvailableDaysRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableDaysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableDaysRequest>(create);
  static GetAvailableDaysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startAtUnix => $_getI64(1);
  @$pb.TagNumber(2)
  set startAtUnix($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartAtUnix() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartAtUnix() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endAtUnix => $_getI64(2);
  @$pb.TagNumber(3)
  set endAtUnix($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndAtUnix() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndAtUnix() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tz => $_getSZ(3);
  @$pb.TagNumber(4)
  set tz($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTz() => $_has(3);
  @$pb.TagNumber(4)
  void clearTz() => clearField(4);
}

class GetAvailableDaysResponse extends $pb.GeneratedMessage {
  factory GetAvailableDaysResponse({
    $core.Iterable<$fixnum.Int64>? availableDaysUnix,
    $core.String? tz,
  }) {
    final $result = create();
    if (availableDaysUnix != null) {
      $result.availableDaysUnix.addAll(availableDaysUnix);
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetAvailableDaysResponse._() : super();
  factory GetAvailableDaysResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableDaysResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableDaysResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'availableDaysUnix', $pb.PbFieldType.K6, protoName: 'availableDaysUnix')
    ..aOS(2, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableDaysResponse clone() => GetAvailableDaysResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableDaysResponse copyWith(void Function(GetAvailableDaysResponse) updates) => super.copyWith((message) => updates(message as GetAvailableDaysResponse)) as GetAvailableDaysResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableDaysResponse create() => GetAvailableDaysResponse._();
  GetAvailableDaysResponse createEmptyInstance() => create();
  static $pb.PbList<GetAvailableDaysResponse> createRepeated() => $pb.PbList<GetAvailableDaysResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableDaysResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableDaysResponse>(create);
  static GetAvailableDaysResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get availableDaysUnix => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get tz => $_getSZ(1);
  @$pb.TagNumber(2)
  set tz($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTz() => $_has(1);
  @$pb.TagNumber(2)
  void clearTz() => clearField(2);
}

class GetAvailableTimeslotsRequest extends $pb.GeneratedMessage {
  factory GetAvailableTimeslotsRequest({
    $core.String? locationId,
    $fixnum.Int64? dayUnix,
    $core.String? tz,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (dayUnix != null) {
      $result.dayUnix = dayUnix;
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetAvailableTimeslotsRequest._() : super();
  factory GetAvailableTimeslotsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableTimeslotsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableTimeslotsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId', protoName: 'locationId')
    ..aInt64(2, _omitFieldNames ? '' : 'dayUnix', protoName: 'dayUnix')
    ..aOS(3, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableTimeslotsRequest clone() => GetAvailableTimeslotsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableTimeslotsRequest copyWith(void Function(GetAvailableTimeslotsRequest) updates) => super.copyWith((message) => updates(message as GetAvailableTimeslotsRequest)) as GetAvailableTimeslotsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableTimeslotsRequest create() => GetAvailableTimeslotsRequest._();
  GetAvailableTimeslotsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAvailableTimeslotsRequest> createRepeated() => $pb.PbList<GetAvailableTimeslotsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableTimeslotsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableTimeslotsRequest>(create);
  static GetAvailableTimeslotsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get dayUnix => $_getI64(1);
  @$pb.TagNumber(2)
  set dayUnix($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDayUnix() => $_has(1);
  @$pb.TagNumber(2)
  void clearDayUnix() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tz => $_getSZ(2);
  @$pb.TagNumber(3)
  set tz($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTz() => $_has(2);
  @$pb.TagNumber(3)
  void clearTz() => clearField(3);
}

class GetAvailableTimeslotsResponse extends $pb.GeneratedMessage {
  factory GetAvailableTimeslotsResponse({
    $core.Iterable<$fixnum.Int64>? startTimesUnix,
    $core.String? tz,
  }) {
    final $result = create();
    if (startTimesUnix != null) {
      $result.startTimesUnix.addAll(startTimesUnix);
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetAvailableTimeslotsResponse._() : super();
  factory GetAvailableTimeslotsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAvailableTimeslotsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAvailableTimeslotsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'startTimesUnix', $pb.PbFieldType.K6, protoName: 'startTimesUnix')
    ..aOS(2, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAvailableTimeslotsResponse clone() => GetAvailableTimeslotsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAvailableTimeslotsResponse copyWith(void Function(GetAvailableTimeslotsResponse) updates) => super.copyWith((message) => updates(message as GetAvailableTimeslotsResponse)) as GetAvailableTimeslotsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAvailableTimeslotsResponse create() => GetAvailableTimeslotsResponse._();
  GetAvailableTimeslotsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAvailableTimeslotsResponse> createRepeated() => $pb.PbList<GetAvailableTimeslotsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAvailableTimeslotsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAvailableTimeslotsResponse>(create);
  static GetAvailableTimeslotsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get startTimesUnix => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get tz => $_getSZ(1);
  @$pb.TagNumber(2)
  set tz($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTz() => $_has(1);
  @$pb.TagNumber(2)
  void clearTz() => clearField(2);
}

class AvailabilityRange extends $pb.GeneratedMessage {
  factory AvailabilityRange({
    $fixnum.Int64? startAtUnix,
    $fixnum.Int64? endAtUnix,
  }) {
    final $result = create();
    if (startAtUnix != null) {
      $result.startAtUnix = startAtUnix;
    }
    if (endAtUnix != null) {
      $result.endAtUnix = endAtUnix;
    }
    return $result;
  }
  AvailabilityRange._() : super();
  factory AvailabilityRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AvailabilityRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AvailabilityRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startAtUnix', protoName: 'startAtUnix')
    ..aInt64(2, _omitFieldNames ? '' : 'endAtUnix', protoName: 'endAtUnix')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AvailabilityRange clone() => AvailabilityRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AvailabilityRange copyWith(void Function(AvailabilityRange) updates) => super.copyWith((message) => updates(message as AvailabilityRange)) as AvailabilityRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailabilityRange create() => AvailabilityRange._();
  AvailabilityRange createEmptyInstance() => create();
  static $pb.PbList<AvailabilityRange> createRepeated() => $pb.PbList<AvailabilityRange>();
  @$core.pragma('dart2js:noInline')
  static AvailabilityRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AvailabilityRange>(create);
  static AvailabilityRange? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startAtUnix => $_getI64(0);
  @$pb.TagNumber(1)
  set startAtUnix($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartAtUnix() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartAtUnix() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endAtUnix => $_getI64(1);
  @$pb.TagNumber(2)
  set endAtUnix($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndAtUnix() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndAtUnix() => clearField(2);
}

class UpsertAvailabilityOverrideRequest extends $pb.GeneratedMessage {
  factory UpsertAvailabilityOverrideRequest({
    $core.String? id,
    $core.String? resourceId,
    $core.String? name,
    $fixnum.Int64? startAtUnix,
    $fixnum.Int64? endAtUnix,
    $core.String? availabilityId,
    $core.Iterable<AvailabilityRange>? availabilityRanges,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (startAtUnix != null) {
      $result.startAtUnix = startAtUnix;
    }
    if (endAtUnix != null) {
      $result.endAtUnix = endAtUnix;
    }
    if (availabilityId != null) {
      $result.availabilityId = availabilityId;
    }
    if (availabilityRanges != null) {
      $result.availabilityRanges.addAll(availabilityRanges);
    }
    return $result;
  }
  UpsertAvailabilityOverrideRequest._() : super();
  factory UpsertAvailabilityOverrideRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertAvailabilityOverrideRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertAvailabilityOverrideRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'resourceId', protoName: 'resourceId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aInt64(5, _omitFieldNames ? '' : 'startAtUnix', protoName: 'startAtUnix')
    ..aInt64(6, _omitFieldNames ? '' : 'endAtUnix', protoName: 'endAtUnix')
    ..aOS(7, _omitFieldNames ? '' : 'availabilityId', protoName: 'availabilityId')
    ..pc<AvailabilityRange>(8, _omitFieldNames ? '' : 'availabilityRanges', $pb.PbFieldType.PM, protoName: 'availabilityRanges', subBuilder: AvailabilityRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityOverrideRequest clone() => UpsertAvailabilityOverrideRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityOverrideRequest copyWith(void Function(UpsertAvailabilityOverrideRequest) updates) => super.copyWith((message) => updates(message as UpsertAvailabilityOverrideRequest)) as UpsertAvailabilityOverrideRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityOverrideRequest create() => UpsertAvailabilityOverrideRequest._();
  UpsertAvailabilityOverrideRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertAvailabilityOverrideRequest> createRepeated() => $pb.PbList<UpsertAvailabilityOverrideRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityOverrideRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertAvailabilityOverrideRequest>(create);
  static UpsertAvailabilityOverrideRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get startAtUnix => $_getI64(3);
  @$pb.TagNumber(5)
  set startAtUnix($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartAtUnix() => $_has(3);
  @$pb.TagNumber(5)
  void clearStartAtUnix() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get endAtUnix => $_getI64(4);
  @$pb.TagNumber(6)
  set endAtUnix($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndAtUnix() => $_has(4);
  @$pb.TagNumber(6)
  void clearEndAtUnix() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get availabilityId => $_getSZ(5);
  @$pb.TagNumber(7)
  set availabilityId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasAvailabilityId() => $_has(5);
  @$pb.TagNumber(7)
  void clearAvailabilityId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<AvailabilityRange> get availabilityRanges => $_getList(6);
}

class UpsertAvailabilityOverrideResponse extends $pb.GeneratedMessage {
  factory UpsertAvailabilityOverrideResponse() => create();
  UpsertAvailabilityOverrideResponse._() : super();
  factory UpsertAvailabilityOverrideResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertAvailabilityOverrideResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertAvailabilityOverrideResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityOverrideResponse clone() => UpsertAvailabilityOverrideResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityOverrideResponse copyWith(void Function(UpsertAvailabilityOverrideResponse) updates) => super.copyWith((message) => updates(message as UpsertAvailabilityOverrideResponse)) as UpsertAvailabilityOverrideResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityOverrideResponse create() => UpsertAvailabilityOverrideResponse._();
  UpsertAvailabilityOverrideResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertAvailabilityOverrideResponse> createRepeated() => $pb.PbList<UpsertAvailabilityOverrideResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityOverrideResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertAvailabilityOverrideResponse>(create);
  static UpsertAvailabilityOverrideResponse? _defaultInstance;
}

class Test extends $pb.GeneratedMessage {
  factory Test({
    $core.Map<$fixnum.Int64, TestSlice>? availability,
  }) {
    final $result = create();
    if (availability != null) {
      $result.availability.addAll(availability);
    }
    return $result;
  }
  Test._() : super();
  factory Test.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Test.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Test', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..m<$fixnum.Int64, TestSlice>(1, _omitFieldNames ? '' : 'availability', entryClassName: 'Test.AvailabilityEntry', keyFieldType: $pb.PbFieldType.O6, valueFieldType: $pb.PbFieldType.OM, valueCreator: TestSlice.create, valueDefaultOrMaker: TestSlice.getDefault, packageName: const $pb.PackageName('proto'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Test clone() => Test()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Test copyWith(void Function(Test) updates) => super.copyWith((message) => updates(message as Test)) as Test;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Test create() => Test._();
  Test createEmptyInstance() => create();
  static $pb.PbList<Test> createRepeated() => $pb.PbList<Test>();
  @$core.pragma('dart2js:noInline')
  static Test getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Test>(create);
  static Test? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$fixnum.Int64, TestSlice> get availability => $_getMap(0);
}

class TestSlice extends $pb.GeneratedMessage {
  factory TestSlice({
    $core.Iterable<$fixnum.Int64>? startTimeUnix,
  }) {
    final $result = create();
    if (startTimeUnix != null) {
      $result.startTimeUnix.addAll(startTimeUnix);
    }
    return $result;
  }
  TestSlice._() : super();
  factory TestSlice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestSlice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TestSlice', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'startTimeUnix', $pb.PbFieldType.K6, protoName: 'startTimeUnix')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestSlice clone() => TestSlice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestSlice copyWith(void Function(TestSlice) updates) => super.copyWith((message) => updates(message as TestSlice)) as TestSlice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestSlice create() => TestSlice._();
  TestSlice createEmptyInstance() => create();
  static $pb.PbList<TestSlice> createRepeated() => $pb.PbList<TestSlice>();
  @$core.pragma('dart2js:noInline')
  static TestSlice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestSlice>(create);
  static TestSlice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get startTimeUnix => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
