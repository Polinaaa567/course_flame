import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';

@freezed
abstract class PlayerState with _$PlayerState {
  const factory PlayerState.alive({required int hp, required int points}) =_alive;
  const factory PlayerState.dead({required int points}) = _dead;
}
