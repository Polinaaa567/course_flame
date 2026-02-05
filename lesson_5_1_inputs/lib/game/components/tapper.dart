import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:lesson_5_1_inputs/game/game.dart';

class Tapper extends RectangleComponent with HasGameReference<MyGame> {
  Tapper(Color color, String text, Vector2 size) : super(size: size) {
    paint = Paint()..color = color;
    size = size;

    add(
      TextComponent(
        text: text,
        anchor: Anchor.center,
        position: Vector2.all(10.0),
        scale: Vector2.all(0.5),
      ),
    );
  }
  static double jumpVelocityDefault = -300.0;
  double jumpVelocity = jumpVelocityDefault;
  bool isJumping = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (isJumping) {
      y += jumpVelocity * dt;
      jumpVelocity += 500 * dt;

      if (y >= game.size.y / 2) {
        isJumping = false;
        jumpVelocity = jumpVelocityDefault;
      }
    }
  }

  void jump() {
    isJumping = true;
  }
}
