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

class UpsertResourceRequest extends $pb.GeneratedMessage {
  factory UpsertResourceRequest({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? locationId,
    $core.String? minimumSegments,
    $core.String? maximumSegments,
    $core.Iterable<$core.bool>? availability,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (locationId != null) {
      $result.locationId = locationId;
    }
    if (minimumSegments != null) {
      $result.minimumSegments = minimumSegments;
    }
    if (maximumSegments != null) {
      $result.maximumSegments = maximumSegments;
    }
    if (availability != null) {
      $result.availability.addAll(availability);
    }
    return $result;
  }
  UpsertResourceRequest._() : super();
  factory UpsertResourceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertResourceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertResourceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'locationId', protoName: 'locationId')
    ..aOS(4, _omitFieldNames ? '' : 'minimumSegments', protoName: 'minimumSegments')
    ..aOS(5, _omitFieldNames ? '' : 'maximumSegments', protoName: 'maximumSegments')
    ..p<$core.bool>(6, _omitFieldNames ? '' : 'availability', $pb.PbFieldType.KB)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertResourceRequest clone() => UpsertResourceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertResourceRequest copyWith(void Function(UpsertResourceRequest) updates) => super.copyWith((message) => updates(message as UpsertResourceRequest)) as UpsertResourceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertResourceRequest create() => UpsertResourceRequest._();
  UpsertResourceRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertResourceRequest> createRepeated() => $pb.PbList<UpsertResourceRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertResourceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertResourceRequest>(create);
  static UpsertResourceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
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
  $fixnum.Int64 get locationId => $_getI64(2);
  @$pb.TagNumber(3)
  set locationId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocationId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get minimumSegments => $_getSZ(3);
  @$pb.TagNumber(4)
  set minimumSegments($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinimumSegments() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinimumSegments() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get maximumSegments => $_getSZ(4);
  @$pb.TagNumber(5)
  set maximumSegments($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaximumSegments() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaximumSegments() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.bool> get availability => $_getList(5);
}

class UpsertResourceResponse extends $pb.GeneratedMessage {
  factory UpsertResourceResponse() => create();
  UpsertResourceResponse._() : super();
  factory UpsertResourceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertResourceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertResourceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertResourceResponse clone() => UpsertResourceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertResourceResponse copyWith(void Function(UpsertResourceResponse) updates) => super.copyWith((message) => updates(message as UpsertResourceResponse)) as UpsertResourceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertResourceResponse create() => UpsertResourceResponse._();
  UpsertResourceResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertResourceResponse> createRepeated() => $pb.PbList<UpsertResourceResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertResourceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertResourceResponse>(create);
  static UpsertResourceResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
