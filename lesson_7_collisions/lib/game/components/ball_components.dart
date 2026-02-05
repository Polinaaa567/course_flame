import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:lesson_7_collisions/game/game_collisions.dart';

class BallComponents extends RectangleComponent
    with HasGameReference<GameCollisions> {
  BallComponents()
    : super(size: Vector2(50, 50), paint: Paint()..color = Colors.yellowAccent);

  Vector2 velocity = Vector2(400, -400);

  @override
  void update(double dt) {
    if (position.x <= 0 || position.x + size.x > game.size.x) {
      velocity.x = -velocity.x;
    }

    if (position.y <= 0 || position.y + size.y > game.size.y) {
      velocity.y = -velocity.y;
    }

    position += velocity * dt;
    super.update(dt);
  }
}
