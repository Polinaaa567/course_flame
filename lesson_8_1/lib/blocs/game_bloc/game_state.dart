import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.notStarter() = _notStarter;
  const factory GameState.gaming({required int points}) = _gaming;
  const factory GameState.gameOver({required int points}) = _gameOver;
}
