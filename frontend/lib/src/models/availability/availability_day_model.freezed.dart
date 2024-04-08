// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_day_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailabilityDayModel {
  String get name => throw _privateConstructorUsedError;
  List<AvailabilityRange> get availabilityRanges =>
      throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name,
            List<AvailabilityRange> availabilityRanges, bool enabled)
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, List<AvailabilityRange> availabilityRanges,
            bool enabled)?
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, List<AvailabilityRange> availabilityRanges,
            bool enabled)?
        def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AvailabilityDayModel value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AvailabilityDayModel value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AvailabilityDayModel value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailabilityDayModelCopyWith<AvailabilityDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityDayModelCopyWith<$Res> {
  factory $AvailabilityDayModelCopyWith(AvailabilityDayModel value,
          $Res Function(AvailabilityDayModel) then) =
      _$AvailabilityDayModelCopyWithImpl<$Res, AvailabilityDayModel>;
  @useResult
  $Res call(
      {String name, List<AvailabilityRange> availabilityRanges, bool enabled});
}

/// @nodoc
class _$AvailabilityDayModelCopyWithImpl<$Res,
        $Val extends AvailabilityDayModel>
    implements $AvailabilityDayModelCopyWith<$Res> {
  _$AvailabilityDayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? availabilityRanges = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityRanges: null == availabilityRanges
          ? _value.availabilityRanges
          : availabilityRanges // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityRange>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailabilityDayModelImplCopyWith<$Res>
    implements $AvailabilityDayModelCopyWith<$Res> {
  factory _$$AvailabilityDayModelImplCopyWith(_$AvailabilityDayModelImpl value,
          $Res Function(_$AvailabilityDayModelImpl) then) =
      __$$AvailabilityDayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<AvailabilityRange> availabilityRanges, bool enabled});
}

/// @nodoc
class __$$AvailabilityDayModelImplCopyWithImpl<$Res>
    extends _$AvailabilityDayModelCopyWithImpl<$Res, _$AvailabilityDayModelImpl>
    implements _$$AvailabilityDayModelImplCopyWith<$Res> {
  __$$AvailabilityDayModelImplCopyWithImpl(_$AvailabilityDayModelImpl _value,
      $Res Function(_$AvailabilityDayModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? availabilityRanges = null,
    Object? enabled = null,
  }) {
    return _then(_$AvailabilityDayModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityRanges: null == availabilityRanges
          ? _value._availabilityRanges
          : availabilityRanges // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityRange>,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AvailabilityDayModelImpl implements _AvailabilityDayModel {
  _$AvailabilityDayModelImpl(
      {required this.name,
      required final List<AvailabilityRange> availabilityRanges,
      required this.enabled})
      : _availabilityRanges = availabilityRanges;

  @override
  final String name;
  final List<AvailabilityRange> _availabilityRanges;
  @override
  List<AvailabilityRange> get availabilityRanges {
    if (_availabilityRanges is EqualUnmodifiableListView)
      return _availabilityRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availabilityRanges);
  }

  @override
  final bool enabled;

  @override
  String toString() {
    return 'AvailabilityDayModel.def(name: $name, availabilityRanges: $availabilityRanges, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityDayModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._availabilityRanges, _availabilityRanges) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_availabilityRanges), enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityDayModelImplCopyWith<_$AvailabilityDayModelImpl>
      get copyWith =>
          __$$AvailabilityDayModelImplCopyWithImpl<_$AvailabilityDayModelImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name,
            List<AvailabilityRange> availabilityRanges, bool enabled)
        def,
  }) {
    return def(name, availabilityRanges, enabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, List<AvailabilityRange> availabilityRanges,
            bool enabled)?
        def,
  }) {
    return def?.call(name, availabilityRanges, enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, List<AvailabilityRange> availabilityRanges,
            bool enabled)?
        def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(name, availabilityRanges, enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AvailabilityDayModel value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AvailabilityDayModel value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AvailabilityDayModel value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }
}

abstract class _AvailabilityDayModel implements AvailabilityDayModel {
  factory _AvailabilityDayModel(
      {required final String name,
      required final List<AvailabilityRange> availabilityRanges,
      required final bool enabled}) = _$AvailabilityDayModelImpl;

  @override
  String get name;
  @override
  List<AvailabilityRange> get availabilityRanges;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$AvailabilityDayModelImplCopyWith<_$AvailabilityDayModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
