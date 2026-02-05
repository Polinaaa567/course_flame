// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent()';
}


}

/// @nodoc
class $PlayerEventCopyWith<$Res>  {
$PlayerEventCopyWith(PlayerEvent _, $Res Function(PlayerEvent) __);
}


/// Adds pattern-matching-related methods to [PlayerEvent].
extension PlayerEventPatterns on PlayerEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerDamageEvent value)?  damage,TResult Function( PlayerIncreasePointEvent value)?  increasePoint,TResult Function( PlayerDecreasePointEvent value)?  decreasePoint,TResult Function( PlayerHealEvent value)?  heal,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerDamageEvent() when damage != null:
return damage(_that);case PlayerIncreasePointEvent() when increasePoint != null:
return increasePoint(_that);case PlayerDecreasePointEvent() when decreasePoint != null:
return decreasePoint(_that);case PlayerHealEvent() when heal != null:
return heal(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerDamageEvent value)  damage,required TResult Function( PlayerIncreasePointEvent value)  increasePoint,required TResult Function( PlayerDecreasePointEvent value)  decreasePoint,required TResult Function( PlayerHealEvent value)  heal,}){
final _that = this;
switch (_that) {
case PlayerDamageEvent():
return damage(_that);case PlayerIncreasePointEvent():
return increasePoint(_that);case PlayerDecreasePointEvent():
return decreasePoint(_that);case PlayerHealEvent():
return heal(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerDamageEvent value)?  damage,TResult? Function( PlayerIncreasePointEvent value)?  increasePoint,TResult? Function( PlayerDecreasePointEvent value)?  decreasePoint,TResult? Function( PlayerHealEvent value)?  heal,}){
final _that = this;
switch (_that) {
case PlayerDamageEvent() when damage != null:
return damage(_that);case PlayerIncreasePointEvent() when increasePoint != null:
return increasePoint(_that);case PlayerDecreasePointEvent() when decreasePoint != null:
return decreasePoint(_that);case PlayerHealEvent() when heal != null:
return heal(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int damage)?  damage,TResult Function()?  increasePoint,TResult Function()?  decreasePoint,TResult Function( int heal)?  heal,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerDamageEvent() when damage != null:
return damage(_that.damage);case PlayerIncreasePointEvent() when increasePoint != null:
return increasePoint();case PlayerDecreasePointEvent() when decreasePoint != null:
return decreasePoint();case PlayerHealEvent() when heal != null:
return heal(_that.heal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int damage)  damage,required TResult Function()  increasePoint,required TResult Function()  decreasePoint,required TResult Function( int heal)  heal,}) {final _that = this;
switch (_that) {
case PlayerDamageEvent():
return damage(_that.damage);case PlayerIncreasePointEvent():
return increasePoint();case PlayerDecreasePointEvent():
return decreasePoint();case PlayerHealEvent():
return heal(_that.heal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int damage)?  damage,TResult? Function()?  increasePoint,TResult? Function()?  decreasePoint,TResult? Function( int heal)?  heal,}) {final _that = this;
switch (_that) {
case PlayerDamageEvent() when damage != null:
return damage(_that.damage);case PlayerIncreasePointEvent() when increasePoint != null:
return increasePoint();case PlayerDecreasePointEvent() when decreasePoint != null:
return decreasePoint();case PlayerHealEvent() when heal != null:
return heal(_that.heal);case _:
  return null;

}
}

}

/// @nodoc


class PlayerDamageEvent implements PlayerEvent {
  const PlayerDamageEvent({required this.damage});
  

 final  int damage;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerDamageEventCopyWith<PlayerDamageEvent> get copyWith => _$PlayerDamageEventCopyWithImpl<PlayerDamageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerDamageEvent&&(identical(other.damage, damage) || other.damage == damage));
}


@override
int get hashCode => Object.hash(runtimeType,damage);

@override
String toString() {
  return 'PlayerEvent.damage(damage: $damage)';
}


}

/// @nodoc
abstract mixin class $PlayerDamageEventCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerDamageEventCopyWith(PlayerDamageEvent value, $Res Function(PlayerDamageEvent) _then) = _$PlayerDamageEventCopyWithImpl;
@useResult
$Res call({
 int damage
});




}
/// @nodoc
class _$PlayerDamageEventCopyWithImpl<$Res>
    implements $PlayerDamageEventCopyWith<$Res> {
  _$PlayerDamageEventCopyWithImpl(this._self, this._then);

  final PlayerDamageEvent _self;
  final $Res Function(PlayerDamageEvent) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? damage = null,}) {
  return _then(PlayerDamageEvent(
damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PlayerIncreasePointEvent implements PlayerEvent {
  const PlayerIncreasePointEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerIncreasePointEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent.increasePoint()';
}


}




/// @nodoc


class PlayerDecreasePointEvent implements PlayerEvent {
  const PlayerDecreasePointEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerDecreasePointEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerEvent.decreasePoint()';
}


}




/// @nodoc


class PlayerHealEvent implements PlayerEvent {
  const PlayerHealEvent({required this.heal});
  

 final  int heal;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerHealEventCopyWith<PlayerHealEvent> get copyWith => _$PlayerHealEventCopyWithImpl<PlayerHealEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerHealEvent&&(identical(other.heal, heal) || other.heal == heal));
}


@override
int get hashCode => Object.hash(runtimeType,heal);

@override
String toString() {
  return 'PlayerEvent.heal(heal: $heal)';
}


}

/// @nodoc
abstract mixin class $PlayerHealEventCopyWith<$Res> implements $PlayerEventCopyWith<$Res> {
  factory $PlayerHealEventCopyWith(PlayerHealEvent value, $Res Function(PlayerHealEvent) _then) = _$PlayerHealEventCopyWithImpl;
@useResult
$Res call({
 int heal
});




}
/// @nodoc
class _$PlayerHealEventCopyWithImpl<$Res>
    implements $PlayerHealEventCopyWith<$Res> {
  _$PlayerHealEventCopyWithImpl(this._self, this._then);

  final PlayerHealEvent _self;
  final $Res Function(PlayerHealEvent) _then;

/// Create a copy of PlayerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heal = null,}) {
  return _then(PlayerHealEvent(
heal: null == heal ? _self.heal : heal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
