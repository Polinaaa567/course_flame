import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:lesson_4_1/game/cosmo_game.dart';
import 'package:lesson_4_1/game/player.dart';

class Asteroid extends RectangleComponent with HasGameReference<CosmoGame> {
  Asteroid() : super(size: Vector2.all(20.0)) {
    paint = Paint()..color = Colors.blueAccent;
  }

  static const asteroidSpeed = 1;
  @override
  void update(double dt) {
    super.update(dt);

    movingToPlayerPosition();

    if (outOfScreen()) {
      removeFromParent();
    }
  }

  movingToPlayerPosition() {
    final player = game.firstChild<Player>();
    if (player == null) {
      return;
    }

    if (checkDistanceLower(player.position, position)) {
      removeFromParent();
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

  bool checkDistanceLower(Vector2 playerPosition, Vector2 asteroidPosition) {
    double distance = sqrt(
      pow(playerPosition.x - asteroidPosition.x, 2) +
          pow(playerPosition.y - asteroidPosition.y, 2),
    );
    if (distance < 5) {
      return true;
    } else {
      return false;
    }
  }

  bool outOfScreen() {
    final screenSize = game.size;
    return position.x > screenSize.x ||
        position.y > screenSize.y ||
        position.x < 0 ||
        position.y < 0;
  }
}
