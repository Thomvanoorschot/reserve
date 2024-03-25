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

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;

class GetStartTimesRequest extends $pb.GeneratedMessage {
  factory GetStartTimesRequest({
    $core.String? locationId,
    $3.Timestamp? startAt,
    $3.Timestamp? endAt,
    $core.String? tz,
  }) {
    final $result = create();
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (startAt != null) {
      $result.startAt = startAt;
    }
    if (endAt != null) {
      $result.endAt = endAt;
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetStartTimesRequest._() : super();
  factory GetStartTimesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStartTimesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStartTimesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'locationId', protoName: 'locationId')
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'startAt', protoName: 'startAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'endAt', protoName: 'endAt', subBuilder: $3.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStartTimesRequest clone() => GetStartTimesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStartTimesRequest copyWith(void Function(GetStartTimesRequest) updates) => super.copyWith((message) => updates(message as GetStartTimesRequest)) as GetStartTimesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStartTimesRequest create() => GetStartTimesRequest._();
  GetStartTimesRequest createEmptyInstance() => create();
  static $pb.PbList<GetStartTimesRequest> createRepeated() => $pb.PbList<GetStartTimesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStartTimesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStartTimesRequest>(create);
  static GetStartTimesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get locationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set locationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);

  @$pb.TagNumber(2)
  $3.Timestamp get startAt => $_getN(1);
  @$pb.TagNumber(2)
  set startAt($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartAt() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureStartAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Timestamp get endAt => $_getN(2);
  @$pb.TagNumber(3)
  set endAt($3.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndAt() => clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureEndAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get tz => $_getSZ(3);
  @$pb.TagNumber(4)
  set tz($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTz() => $_has(3);
  @$pb.TagNumber(4)
  void clearTz() => clearField(4);
}

class GetStartTimesResponse extends $pb.GeneratedMessage {
  factory GetStartTimesResponse({
    $core.Iterable<$3.Timestamp>? startTimes,
    $core.String? tz,
  }) {
    final $result = create();
    if (startTimes != null) {
      $result.startTimes.addAll(startTimes);
    }
    if (tz != null) {
      $result.tz = tz;
    }
    return $result;
  }
  GetStartTimesResponse._() : super();
  factory GetStartTimesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStartTimesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStartTimesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..pc<$3.Timestamp>(1, _omitFieldNames ? '' : 'startTimes', $pb.PbFieldType.PM, protoName: 'startTimes', subBuilder: $3.Timestamp.create)
    ..aOS(2, _omitFieldNames ? '' : 'tz')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStartTimesResponse clone() => GetStartTimesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStartTimesResponse copyWith(void Function(GetStartTimesResponse) updates) => super.copyWith((message) => updates(message as GetStartTimesResponse)) as GetStartTimesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStartTimesResponse create() => GetStartTimesResponse._();
  GetStartTimesResponse createEmptyInstance() => create();
  static $pb.PbList<GetStartTimesResponse> createRepeated() => $pb.PbList<GetStartTimesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStartTimesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStartTimesResponse>(create);
  static GetStartTimesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Timestamp> get startTimes => $_getList(0);

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
    $3.Timestamp? startAt,
    $3.Timestamp? endAt,
  }) {
    final $result = create();
    if (startAt != null) {
      $result.startAt = startAt;
    }
    if (endAt != null) {
      $result.endAt = endAt;
    }
    return $result;
  }
  AvailabilityRange._() : super();
  factory AvailabilityRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AvailabilityRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AvailabilityRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOM<$3.Timestamp>(1, _omitFieldNames ? '' : 'startAt', protoName: 'startAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'endAt', protoName: 'endAt', subBuilder: $3.Timestamp.create)
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
  $3.Timestamp get startAt => $_getN(0);
  @$pb.TagNumber(1)
  set startAt($3.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartAt() => clearField(1);
  @$pb.TagNumber(1)
  $3.Timestamp ensureStartAt() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.Timestamp get endAt => $_getN(1);
  @$pb.TagNumber(2)
  set endAt($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndAt() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureEndAt() => $_ensure(1);
}

class UpsertAvailabilityOverrideRequest extends $pb.GeneratedMessage {
  factory UpsertAvailabilityOverrideRequest({
    $core.String? id,
    $core.String? resourceId,
    $core.String? name,
    $3.Timestamp? startAt,
    $3.Timestamp? endAt,
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
    if (startAt != null) {
      $result.startAt = startAt;
    }
    if (endAt != null) {
      $result.endAt = endAt;
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
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'startAt', protoName: 'startAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'endAt', protoName: 'endAt', subBuilder: $3.Timestamp.create)
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
  $3.Timestamp get startAt => $_getN(3);
  @$pb.TagNumber(5)
  set startAt($3.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartAt() => $_has(3);
  @$pb.TagNumber(5)
  void clearStartAt() => clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureStartAt() => $_ensure(3);

  @$pb.TagNumber(6)
  $3.Timestamp get endAt => $_getN(4);
  @$pb.TagNumber(6)
  set endAt($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndAt() => $_has(4);
  @$pb.TagNumber(6)
  void clearEndAt() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureEndAt() => $_ensure(4);

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
