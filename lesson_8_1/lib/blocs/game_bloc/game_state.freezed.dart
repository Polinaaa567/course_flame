// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState()';
}


}

/// @nodoc
class $GameStateCopyWith<$Res>  {
$GameStateCopyWith(GameState _, $Res Function(GameState) __);
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _notStarter value)?  notStarter,TResult Function( _gaming value)?  gaming,TResult Function( _gameOver value)?  gameOver,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _notStarter() when notStarter != null:
return notStarter(_that);case _gaming() when gaming != null:
return gaming(_that);case _gameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _notStarter value)  notStarter,required TResult Function( _gaming value)  gaming,required TResult Function( _gameOver value)  gameOver,}){
final _that = this;
switch (_that) {
case _notStarter():
return notStarter(_that);case _gaming():
return gaming(_that);case _gameOver():
return gameOver(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _notStarter value)?  notStarter,TResult? Function( _gaming value)?  gaming,TResult? Function( _gameOver value)?  gameOver,}){
final _that = this;
switch (_that) {
case _notStarter() when notStarter != null:
return notStarter(_that);case _gaming() when gaming != null:
return gaming(_that);case _gameOver() when gameOver != null:
return gameOver(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  notStarter,TResult Function( int points)?  gaming,TResult Function( int points)?  gameOver,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _notStarter() when notStarter != null:
return notStarter();case _gaming() when gaming != null:
return gaming(_that.points);case _gameOver() when gameOver != null:
return gameOver(_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  notStarter,required TResult Function( int points)  gaming,required TResult Function( int points)  gameOver,}) {final _that = this;
switch (_that) {
case _notStarter():
return notStarter();case _gaming():
return gaming(_that.points);case _gameOver():
return gameOver(_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  notStarter,TResult? Function( int points)?  gaming,TResult? Function( int points)?  gameOver,}) {final _that = this;
switch (_that) {
case _notStarter() when notStarter != null:
return notStarter();case _gaming() when gaming != null:
return gaming(_that.points);case _gameOver() when gameOver != null:
return gameOver(_that.points);case _:
  return null;

}
}

}

/// @nodoc


class _notStarter implements GameState {
  const _notStarter();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _notStarter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.notStarter()';
}


}




/// @nodoc


class _gaming implements GameState {
  const _gaming({required this.points});
  

 final  int points;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$gamingCopyWith<_gaming> get copyWith => __$gamingCopyWithImpl<_gaming>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _gaming&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,points);

@override
String toString() {
  return 'GameState.gaming(points: $points)';
}


}

/// @nodoc
abstract mixin class _$gamingCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$gamingCopyWith(_gaming value, $Res Function(_gaming) _then) = __$gamingCopyWithImpl;
@useResult
$Res call({
 int points
});




}
/// @nodoc
class __$gamingCopyWithImpl<$Res>
    implements _$gamingCopyWith<$Res> {
  __$gamingCopyWithImpl(this._self, this._then);

  final _gaming _self;
  final $Res Function(_gaming) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? points = null,}) {
  return _then(_gaming(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _gameOver implements GameState {
  const _gameOver({required this.points});
  

 final  int points;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$gameOverCopyWith<_gameOver> get copyWith => __$gameOverCopyWithImpl<_gameOver>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _gameOver&&(identical(other.points, points) || other.points == points));
}


@override
int get hashCode => Object.hash(runtimeType,points);

@override
String toString() {
  return 'GameState.gameOver(points: $points)';
}


}

/// @nodoc
abstract mixin class _$gameOverCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$gameOverCopyWith(_gameOver value, $Res Function(_gameOver) _then) = __$gameOverCopyWithImpl;
@useResult
$Res call({
 int points
});




}
/// @nodoc
class __$gameOverCopyWithImpl<$Res>
    implements _$gameOverCopyWith<$Res> {
  __$gameOverCopyWithImpl(this._self, this._then);

  final _gameOver _self;
  final $Res Function(_gameOver) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? points = null,}) {
  return _then(_gameOver(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
