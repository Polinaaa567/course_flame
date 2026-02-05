import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:lesson_4_1/game/cosmo_game.dart';

class Player extends RectangleComponent with HasGameReference<CosmoGame> {
  Player() : super(size: Vector2.all(20.0)) {
    paint = Paint()..color = Colors.yellow;
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.y += 0.2;
  }
}
