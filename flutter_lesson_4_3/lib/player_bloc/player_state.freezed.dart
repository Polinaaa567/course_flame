// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerState {

 int get points;
/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStateCopyWith<PlayerState> get copyWith => _$PlayerStateCopyWithImpl<PlayerState>(this as PlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerState&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,points);

@override
String toString() {
  return 'PlayerState(points: $points)';
}


}

/// @nodoc
abstract mixin class $PlayerStateCopyWith<$Res>  {
  factory $PlayerStateCopyWith(PlayerState value, $Res Function(PlayerState) _then) = _$PlayerStateCopyWithImpl;
@useResult
$Res call({
 int points
});




}
/// @nodoc
class _$PlayerStateCopyWithImpl<$Res>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._self, this._then);

  final PlayerState _self;
  final $Res Function(PlayerState) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerState].
extension PlayerStatePatterns on PlayerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _alive value)?  alive,TResult Function( _dead value)?  dead,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _alive() when alive != null:
return alive(_that);case _dead() when dead != null:
return dead(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _alive value)  alive,required TResult Function( _dead value)  dead,}){
final _that = this;
switch (_that) {
case _alive():
return alive(_that);case _dead():
return dead(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _alive value)?  alive,TResult? Function( _dead value)?  dead,}){
final _that = this;
switch (_that) {
case _alive() when alive != null:
return alive(_that);case _dead() when dead != null:
return dead(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int hp,  int points)?  alive,TResult Function( int points)?  dead,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _alive() when alive != null:
return alive(_that.hp,_that.points);case _dead() when dead != null:
return dead(_that.points);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int hp,  int points)  alive,required TResult Function( int points)  dead,}) {final _that = this;
switch (_that) {
case _alive():
return alive(_that.hp,_that.points);case _dead():
return dead(_that.points);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int hp,  int points)?  alive,TResult? Function( int points)?  dead,}) {final _that = this;
switch (_that) {
case _alive() when alive != null:
return alive(_that.hp,_that.points);case _dead() when dead != null:
return dead(_that.points);case _:
  return null;

}
}

}

/// @nodoc


class _alive implements PlayerState {
  const _alive({required this.hp, required this.points});
  

 final  int hp;
@override final  int points;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$aliveCopyWith<_alive> get copyWith => __$aliveCopyWithImpl<_alive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _alive&&(identical(other.hp, hp) || other.hp == hp)&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,hp,points);

@override
String toString() {
  return 'PlayerState.alive(hp: $hp, points: $points)';
}


}

/// @nodoc
abstract mixin class _$aliveCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory _$aliveCopyWith(_alive value, $Res Function(_alive) _then) = __$aliveCopyWithImpl;
@override @useResult
$Res call({
 int hp, int points
});




}
/// @nodoc
class __$aliveCopyWithImpl<$Res>
    implements _$aliveCopyWith<$Res> {
  __$aliveCopyWithImpl(this._self, this._then);

  final _alive _self;
  final $Res Function(_alive) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hp = null,Object? points = null,}) {
  return _then(_alive(
hp: null == hp ? _self.hp : hp // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _dead implements PlayerState {
  const _dead({required this.points});
  

@override final  int points;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$deadCopyWith<_dead> get copyWith => __$deadCopyWithImpl<_dead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _dead&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,points);

@override
String toString() {
  return 'PlayerState.dead(points: $points)';
}


}

/// @nodoc
abstract mixin class _$deadCopyWith<$Res> implements $PlayerStateCopyWith<$Res> {
  factory _$deadCopyWith(_dead value, $Res Function(_dead) _then) = __$deadCopyWithImpl;
@override @useResult
$Res call({
 int points
});




}
/// @nodoc
class __$deadCopyWithImpl<$Res>
    implements _$deadCopyWith<$Res> {
  __$deadCopyWithImpl(this._self, this._then);

  final _dead _self;
  final $Res Function(_dead) _then;

/// Create a copy of PlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,}) {
  return _then(_dead(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
