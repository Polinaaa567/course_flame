import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_event.freezed.dart';

@freezed
class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.damage({required int damage}) = PlayerDamageEvent;
  const factory PlayerEvent.increasePoint() = PlayerIncreasePointEvent;
  const factory PlayerEvent.decreasePoint() = PlayerDecreasePointEvent;
  const factory PlayerEvent.heal({required int heal}) = PlayerHealEvent;
}
