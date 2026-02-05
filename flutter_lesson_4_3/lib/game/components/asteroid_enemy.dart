import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter_lesson_4_3/game/components/asteroid.dart';
import 'package:flutter_lesson_4_3/game/components/player.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_bloc.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_event.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_state.dart';

class AsteroidEnemy extends Asteroid with TapCallbacks {
  AsteroidEnemy(super.color);

  @override
  void onPlayerCollision(Player player) {
    removeFromParent();
    player.takeHit(10);
    player.decreasePoint();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    final playerBloc = game
        .firstChild<FlameBlocProvider<PlayerBloc, PlayerState>>();

    playerBloc?.bloc.add(const PlayerEvent.increasePoint());
    removeFromParent();
  }
}
