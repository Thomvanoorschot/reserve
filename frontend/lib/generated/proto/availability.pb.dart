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

class UpsertAvailabilityRequest extends $pb.GeneratedMessage {
  factory UpsertAvailabilityRequest() => create();
  UpsertAvailabilityRequest._() : super();
  factory UpsertAvailabilityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertAvailabilityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertAvailabilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityRequest clone() => UpsertAvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityRequest copyWith(void Function(UpsertAvailabilityRequest) updates) => super.copyWith((message) => updates(message as UpsertAvailabilityRequest)) as UpsertAvailabilityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityRequest create() => UpsertAvailabilityRequest._();
  UpsertAvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertAvailabilityRequest> createRepeated() => $pb.PbList<UpsertAvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertAvailabilityRequest>(create);
  static UpsertAvailabilityRequest? _defaultInstance;
}

class UpsertAvailabilityResponse extends $pb.GeneratedMessage {
  factory UpsertAvailabilityResponse() => create();
  UpsertAvailabilityResponse._() : super();
  factory UpsertAvailabilityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertAvailabilityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertAvailabilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityResponse clone() => UpsertAvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertAvailabilityResponse copyWith(void Function(UpsertAvailabilityResponse) updates) => super.copyWith((message) => updates(message as UpsertAvailabilityResponse)) as UpsertAvailabilityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityResponse create() => UpsertAvailabilityResponse._();
  UpsertAvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertAvailabilityResponse> createRepeated() => $pb.PbList<UpsertAvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertAvailabilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertAvailabilityResponse>(create);
  static UpsertAvailabilityResponse? _defaultInstance;
}


const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
