//
//  Generated code. Do not modify.
//  source: main.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class TestRPCRequest extends $pb.GeneratedMessage {
  factory TestRPCRequest({
    $core.String? testField,
  }) {
    final $result = create();
    if (testField != null) {
      $result.testField = testField;
    }
    return $result;
  }
  TestRPCRequest._() : super();
  factory TestRPCRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestRPCRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TestRPCRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testField', protoName: 'testField')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestRPCRequest clone() => TestRPCRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestRPCRequest copyWith(void Function(TestRPCRequest) updates) => super.copyWith((message) => updates(message as TestRPCRequest)) as TestRPCRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestRPCRequest create() => TestRPCRequest._();
  TestRPCRequest createEmptyInstance() => create();
  static $pb.PbList<TestRPCRequest> createRepeated() => $pb.PbList<TestRPCRequest>();
  @$core.pragma('dart2js:noInline')
  static TestRPCRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestRPCRequest>(create);
  static TestRPCRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testField => $_getSZ(0);
  @$pb.TagNumber(1)
  set testField($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTestField() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestField() => clearField(1);
}

class TestRPCResponse extends $pb.GeneratedMessage {
  factory TestRPCResponse({
    $core.String? testField,
  }) {
    final $result = create();
    if (testField != null) {
      $result.testField = testField;
    }
    return $result;
  }
  TestRPCResponse._() : super();
  factory TestRPCResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestRPCResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TestRPCResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testField', protoName: 'testField')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TestRPCResponse clone() => TestRPCResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TestRPCResponse copyWith(void Function(TestRPCResponse) updates) => super.copyWith((message) => updates(message as TestRPCResponse)) as TestRPCResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestRPCResponse create() => TestRPCResponse._();
  TestRPCResponse createEmptyInstance() => create();
  static $pb.PbList<TestRPCResponse> createRepeated() => $pb.PbList<TestRPCResponse>();
  @$core.pragma('dart2js:noInline')
  static TestRPCResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestRPCResponse>(create);
  static TestRPCResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get testField => $_getSZ(0);
  @$pb.TagNumber(1)
  set testField($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTestField() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestField() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
