// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteTypeState {
  Set<RouteType> get selectedRouteTypes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteTypeStateCopyWith<RouteTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteTypeStateCopyWith<$Res> {
  factory $RouteTypeStateCopyWith(
          RouteTypeState value, $Res Function(RouteTypeState) then) =
      _$RouteTypeStateCopyWithImpl<$Res, RouteTypeState>;
  @useResult
  $Res call({Set<RouteType> selectedRouteTypes});
}

/// @nodoc
class _$RouteTypeStateCopyWithImpl<$Res, $Val extends RouteTypeState>
    implements $RouteTypeStateCopyWith<$Res> {
  _$RouteTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRouteTypes = null,
  }) {
    return _then(_value.copyWith(
      selectedRouteTypes: null == selectedRouteTypes
          ? _value.selectedRouteTypes
          : selectedRouteTypes // ignore: cast_nullable_to_non_nullable
              as Set<RouteType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteTypeStateCopyWith<$Res>
    implements $RouteTypeStateCopyWith<$Res> {
  factory _$$_RouteTypeStateCopyWith(
          _$_RouteTypeState value, $Res Function(_$_RouteTypeState) then) =
      __$$_RouteTypeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<RouteType> selectedRouteTypes});
}

/// @nodoc
class __$$_RouteTypeStateCopyWithImpl<$Res>
    extends _$RouteTypeStateCopyWithImpl<$Res, _$_RouteTypeState>
    implements _$$_RouteTypeStateCopyWith<$Res> {
  __$$_RouteTypeStateCopyWithImpl(
      _$_RouteTypeState _value, $Res Function(_$_RouteTypeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRouteTypes = null,
  }) {
    return _then(_$_RouteTypeState(
      selectedRouteTypes: null == selectedRouteTypes
          ? _value._selectedRouteTypes
          : selectedRouteTypes // ignore: cast_nullable_to_non_nullable
              as Set<RouteType>,
    ));
  }
}

/// @nodoc

class _$_RouteTypeState implements _RouteTypeState {
  const _$_RouteTypeState(
      {final Set<RouteType> selectedRouteTypes = const {RouteType.All}})
      : _selectedRouteTypes = selectedRouteTypes;

  final Set<RouteType> _selectedRouteTypes;
  @override
  @JsonKey()
  Set<RouteType> get selectedRouteTypes {
    if (_selectedRouteTypes is EqualUnmodifiableSetView)
      return _selectedRouteTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedRouteTypes);
  }

  @override
  String toString() {
    return 'RouteTypeState(selectedRouteTypes: $selectedRouteTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteTypeState &&
            const DeepCollectionEquality()
                .equals(other._selectedRouteTypes, _selectedRouteTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedRouteTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteTypeStateCopyWith<_$_RouteTypeState> get copyWith =>
      __$$_RouteTypeStateCopyWithImpl<_$_RouteTypeState>(this, _$identity);
}

abstract class _RouteTypeState implements RouteTypeState {
  const factory _RouteTypeState({final Set<RouteType> selectedRouteTypes}) =
      _$_RouteTypeState;

  @override
  Set<RouteType> get selectedRouteTypes;
  @override
  @JsonKey(ignore: true)
  _$$_RouteTypeStateCopyWith<_$_RouteTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}
