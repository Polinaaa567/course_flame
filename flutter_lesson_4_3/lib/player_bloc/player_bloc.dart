import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_lesson_4_3/player_bloc/player_event.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState.alive(hp: 100, points: 0)) {
    on<PlayerDamageEvent>(_onPlayerDamage);
    on<PlayerIncreasePointEvent>(_onPlayerIncreasePoint);
    on<PlayerDecreasePointEvent>(_onPlayerDecreasePoint);
    on<PlayerHealEvent>(_onPlayerHeal);
  }

  void _onPlayerDamage(PlayerDamageEvent event, Emitter<PlayerState> emit) {
    state.when(
      alive: (int hp, int points) {
        if (hp - event.damage < 0) {
          emit(PlayerState.dead(points: points));
        } else {
          emit(PlayerState.alive(hp: hp - event.damage, points: points));
        }
      },
      dead: (points) => (),
    );
  }

  void _onPlayerIncreasePoint(
    PlayerIncreasePointEvent event,
    Emitter<PlayerState> emit,
  ) {
    state.when(
      alive: (int hp, int points) {
        emit(PlayerState.alive(hp: hp, points: points + 1));
      },
      dead: (points) => (),
    );
  }

  void _onPlayerDecreasePoint(
    PlayerDecreasePointEvent event,
    Emitter<PlayerState> emit,
  ) {
    state.when(
      alive: (int hp, int points) {
        int totalPoints = points;
        if (totalPoints > 0) totalPoints--;
        emit(PlayerState.alive(hp: hp, points: totalPoints));
      },
      dead: (points) => (),
    );
  }

  void _onPlayerHeal(PlayerHealEvent event, Emitter<PlayerState> emit) {
    state.when(
      alive: (int hp, int points) {
        if (hp < 0) {
          emit(PlayerState.dead(points: points));
        } else {
          if (hp < 100) emit(PlayerState.alive(hp: hp + event.heal, points: points));
        }
      },
      dead: (points) => (),
    );
  }
}
