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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
