import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:homework_lesson_7/game/game_ball.dart';

abstract class Ball extends RectangleComponent
    with HasGameReference<GameBall> {
  Ball({required super.paint, required super.size})
    : super(anchor: Anchor.topLeft);

  late final Vector2 velocity;

  @override
  bool get debugMode => true;

  Vector2 getRandomVelocity() {
    final random = Random();
    return Vector2(
      (random.nextBool() ? 1 : -1) * (random.nextDouble() * 150),
      (random.nextBool() ? 1 : -1) * (random.nextDouble() * 150),
    );
  }

  @override
  FutureOr<void> onLoad() {
     super.onLoad();
    add(RectangleHitbox(size: size));
    velocity = getRandomVelocity();
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;

    handleBoundaryCollisions();
  }

  void handleBoundaryCollisions() {
    final gameSize = game.size;
    if (position.x <= 0) {
      velocity.x = velocity.x.abs();
      position.x = 0;
    } else if (position.x + size.x >= gameSize.x) {
      velocity.x = -velocity.x.abs();
      position.x = gameSize.x - size.x;
    }

    if (position.y <= 0) {
      velocity.y = velocity.y.abs();
      position.y = 0;
    } else if (position.y + size.y >= gameSize.y) {
      velocity.y = -velocity.y.abs();
      position.y = gameSize.y - size.y;
    }
  }
}
