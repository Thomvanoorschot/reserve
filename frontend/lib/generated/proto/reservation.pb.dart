//
//  Generated code. Do not modify.
//  source: reservation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class UpsertReservationRequest extends $pb.GeneratedMessage {
  factory UpsertReservationRequest({
    $core.String? reservationId,
    $core.String? resourceId,
    $fixnum.Int64? startAtUnix,
    $fixnum.Int64? endAtUnix,
  }) {
    final $result = create();
    if (reservationId != null) {
      $result.reservationId = reservationId;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    if (startAtUnix != null) {
      $result.startAtUnix = startAtUnix;
    }
    if (endAtUnix != null) {
      $result.endAtUnix = endAtUnix;
    }
    return $result;
  }
  UpsertReservationRequest._() : super();
  factory UpsertReservationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertReservationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertReservationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reservationId', protoName: 'reservationId')
    ..aOS(2, _omitFieldNames ? '' : 'resourceId', protoName: 'resourceId')
    ..aInt64(3, _omitFieldNames ? '' : 'startAtUnix', protoName: 'startAtUnix')
    ..aInt64(4, _omitFieldNames ? '' : 'endAtUnix', protoName: 'endAtUnix')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertReservationRequest clone() => UpsertReservationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertReservationRequest copyWith(void Function(UpsertReservationRequest) updates) => super.copyWith((message) => updates(message as UpsertReservationRequest)) as UpsertReservationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertReservationRequest create() => UpsertReservationRequest._();
  UpsertReservationRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertReservationRequest> createRepeated() => $pb.PbList<UpsertReservationRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertReservationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertReservationRequest>(create);
  static UpsertReservationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reservationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reservationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReservationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReservationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startAtUnix => $_getI64(2);
  @$pb.TagNumber(3)
  set startAtUnix($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartAtUnix() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartAtUnix() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get endAtUnix => $_getI64(3);
  @$pb.TagNumber(4)
  set endAtUnix($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndAtUnix() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndAtUnix() => clearField(4);
}

class UpsertReservationResponse extends $pb.GeneratedMessage {
  factory UpsertReservationResponse({
    $core.String? reservationId,
    $fixnum.Int64? reservedUntilUnix,
  }) {
    final $result = create();
    if (reservationId != null) {
      $result.reservationId = reservationId;
    }
    if (reservedUntilUnix != null) {
      $result.reservedUntilUnix = reservedUntilUnix;
    }
    return $result;
  }
  UpsertReservationResponse._() : super();
  factory UpsertReservationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertReservationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertReservationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reservationId', protoName: 'reservationId')
    ..aInt64(2, _omitFieldNames ? '' : 'reservedUntilUnix', protoName: 'reservedUntilUnix')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertReservationResponse clone() => UpsertReservationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertReservationResponse copyWith(void Function(UpsertReservationResponse) updates) => super.copyWith((message) => updates(message as UpsertReservationResponse)) as UpsertReservationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertReservationResponse create() => UpsertReservationResponse._();
  UpsertReservationResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertReservationResponse> createRepeated() => $pb.PbList<UpsertReservationResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertReservationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertReservationResponse>(create);
  static UpsertReservationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reservationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reservationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReservationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReservationId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get reservedUntilUnix => $_getI64(1);
  @$pb.TagNumber(2)
  set reservedUntilUnix($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReservedUntilUnix() => $_has(1);
  @$pb.TagNumber(2)
  void clearReservedUntilUnix() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
