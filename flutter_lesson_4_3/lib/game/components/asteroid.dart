import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/image_composition.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lesson_4_3/game/components/player.dart';
import 'package:flutter_lesson_4_3/game/cosmo_game_upgraded.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_bloc.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_state.dart';

class Asteroid extends RectangleComponent
    with HasGameReference<CosmoGameUpgraded> {
  Asteroid(Color color) : super(size: Vector2.all(20.0)) {
    paint = Paint()..color = color;
  }

  static const double asteroidSpeed = 1.0;

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    movingToPlayerposition();
  }

  void onPlayerCollision(Player player) {
    removeFromParent();
  }

  void movingToPlayerposition() {
    final playerBloc = game
        .firstChild<FlameBlocProvider<PlayerBloc, PlayerState>>();

    if (playerBloc?.children.isEmpty ?? true) return;
    final player = playerBloc?.children.first as Player?;
    if (player == null) return;

    if (_checkDistanceLower(player.position, position, 5)) {
      onPlayerCollision(player);
    }

    Vector2 vectorForMoving = Vector2(
      player.position.x - position.x,
      player.position.y - position.y,
    );
    vectorForMoving.normalize();

    position = Vector2(
      position.x + vectorForMoving.x * asteroidSpeed,
      position.y + vectorForMoving.y * asteroidSpeed,
    );
  }

  bool _checkDistanceLower(
    Vector2 playerPos,
    Vector2 asteroidPos,
    double offset,
  ) {
    double distance = sqrt(
      pow(playerPos.x - asteroidPos.x, 2) + pow(playerPos.y - asteroidPos.y, 2),
    );
    return distance < offset;
  }
}
