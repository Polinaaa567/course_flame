import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_event.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState.notStarter()) {
    on<GameIncreasePointEvent>(_onIncreasePoint);
    on<GameDecreasePointEvent>(_onDecreasePoint);
    on<GameStartEvent>(_onStartGame);
  }

  void _onIncreasePoint(GameIncreasePointEvent event, Emitter<GameState> emit) {
    state.when(
      notStarter: () => {},
      gaming: (points) {
        emit(GameState.gaming(points: points + 1));
        if (points == 2) {
          emit(GameState.gameOver(points: points));
        }
      },
      gameOver: (points) => {},
    );
  }

  void _onDecreasePoint(GameDecreasePointEvent event, Emitter<GameState> emit) {
    state.when(
      notStarter: () => {},
      gaming: (points) => emit(GameState.gaming(points: points - 1)),
      gameOver: (points) => {},
    );
  }

  void _onStartGame(GameStartEvent event, Emitter<GameState> emit) {
    emit(GameState.gaming(points: 0));
  }
}
