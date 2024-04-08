// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationModel {
  String get name => throw _privateConstructorUsedError;
  List<AvailabilityDayModel> get availabilityRanges =>
      throw _privateConstructorUsedError;
  String get tz => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {String name, List<AvailabilityDayModel> availabilityRanges, String tz});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? availabilityRanges = null,
    Object? tz = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityRanges: null == availabilityRanges
          ? _value.availabilityRanges
          : availabilityRanges // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityDayModel>,
      tz: null == tz
          ? _value.tz
          : tz // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, List<AvailabilityDayModel> availabilityRanges, String tz});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? availabilityRanges = null,
    Object? tz = null,
  }) {
    return _then(_$LocationModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      availabilityRanges: null == availabilityRanges
          ? _value._availabilityRanges
          : availabilityRanges // ignore: cast_nullable_to_non_nullable
              as List<AvailabilityDayModel>,
      tz: null == tz
          ? _value.tz
          : tz // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationModelImpl implements _LocationModel {
  _$LocationModelImpl(
      {required this.name,
      required final List<AvailabilityDayModel> availabilityRanges,
      required this.tz})
      : _availabilityRanges = availabilityRanges;

  @override
  final String name;
  final List<AvailabilityDayModel> _availabilityRanges;
  @override
  List<AvailabilityDayModel> get availabilityRanges {
    if (_availabilityRanges is EqualUnmodifiableListView)
      return _availabilityRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availabilityRanges);
  }

  @override
  final String tz;

  @override
  String toString() {
    return 'LocationModel(name: $name, availabilityRanges: $availabilityRanges, tz: $tz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._availabilityRanges, _availabilityRanges) &&
            (identical(other.tz, tz) || other.tz == tz));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_availabilityRanges), tz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel(
      {required final String name,
      required final List<AvailabilityDayModel> availabilityRanges,
      required final String tz}) = _$LocationModelImpl;

  @override
  String get name;
  @override
  List<AvailabilityDayModel> get availabilityRanges;
  @override
  String get tz;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
