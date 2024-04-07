// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_create_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailabilityDay {
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
    required TResult Function(_AvailabilityDay value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AvailabilityDay value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AvailabilityDay value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailabilityDayCopyWith<AvailabilityDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityDayCopyWith<$Res> {
  factory $AvailabilityDayCopyWith(
          AvailabilityDay value, $Res Function(AvailabilityDay) then) =
      _$AvailabilityDayCopyWithImpl<$Res, AvailabilityDay>;
  @useResult
  $Res call(
      {String name, List<AvailabilityRange> availabilityRanges, bool enabled});
}

/// @nodoc
class _$AvailabilityDayCopyWithImpl<$Res, $Val extends AvailabilityDay>
    implements $AvailabilityDayCopyWith<$Res> {
  _$AvailabilityDayCopyWithImpl(this._value, this._then);

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
abstract class _$$AvailabilityDayImplCopyWith<$Res>
    implements $AvailabilityDayCopyWith<$Res> {
  factory _$$AvailabilityDayImplCopyWith(_$AvailabilityDayImpl value,
          $Res Function(_$AvailabilityDayImpl) then) =
      __$$AvailabilityDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<AvailabilityRange> availabilityRanges, bool enabled});
}

/// @nodoc
class __$$AvailabilityDayImplCopyWithImpl<$Res>
    extends _$AvailabilityDayCopyWithImpl<$Res, _$AvailabilityDayImpl>
    implements _$$AvailabilityDayImplCopyWith<$Res> {
  __$$AvailabilityDayImplCopyWithImpl(
      _$AvailabilityDayImpl _value, $Res Function(_$AvailabilityDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? availabilityRanges = null,
    Object? enabled = null,
  }) {
    return _then(_$AvailabilityDayImpl(
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

class _$AvailabilityDayImpl implements _AvailabilityDay {
  _$AvailabilityDayImpl(
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
    return 'AvailabilityDay.def(name: $name, availabilityRanges: $availabilityRanges, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityDayImpl &&
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
  _$$AvailabilityDayImplCopyWith<_$AvailabilityDayImpl> get copyWith =>
      __$$AvailabilityDayImplCopyWithImpl<_$AvailabilityDayImpl>(
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
    required TResult Function(_AvailabilityDay value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AvailabilityDay value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AvailabilityDay value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }
}

abstract class _AvailabilityDay implements AvailabilityDay {
  factory _AvailabilityDay(
      {required final String name,
      required final List<AvailabilityRange> availabilityRanges,
      required final bool enabled}) = _$AvailabilityDayImpl;

  @override
  String get name;
  @override
  List<AvailabilityRange> get availabilityRanges;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$AvailabilityDayImplCopyWith<_$AvailabilityDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
