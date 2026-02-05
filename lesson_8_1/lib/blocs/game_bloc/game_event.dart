import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_event.freezed.dart';


@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.startGame() = GameStartEvent;
  const factory GameEvent.increasePoint() = GameIncreasePointEvent;
  const factory GameEvent.decreasePoint() = GameDecreasePointEvent;
}
