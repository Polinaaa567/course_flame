import 'dart:math';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:homework_lesson_7/game/components/ball.dart';
import 'package:homework_lesson_7/game/components/blue_ball.dart';
import 'package:homework_lesson_7/game/components/red_ball.dart';

class GameBall extends FlameGame {
  @override
  Color backgroundColor() => Colors.white38;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    spawnInitialBalls();
  }

  void spawnInitialBalls() {
    for (int i = 0; i < 3; i++) {
      spawnRedBall();
      spawnBlueBall();
    }
  }

  void spawnRedBall() {
    final ball = RedBall();
    final ballSize = ball.size;
    add(ball..position = getRandomBorderPosition(size.x, size.y, ballSize));
  }

  void spawnBlueBall() {
    final ball = BlueBall();
    final ballSize = ball.size;
    add(ball..position = getRandomBorderPosition(size.x, size.y, ballSize));
  }

  Vector2 getRandomBorderPosition(
    double width,
    double height,
    Vector2 objectSize,
  ) {
    final random = Random();
    return Vector2(
      random.nextDouble() * (width - objectSize.x),
      random.nextDouble() * (height - objectSize.y),
    );
  }

  int getCountRedBall() {
    final redBall = children.whereType<RedBall>();
    return redBall.length;
  }

  int getCountBlueBall() {
    final blueBall = children.whereType<BlueBall>();
    return blueBall.length;
  }

  @override
  void update(double dt) {
    super.update(dt);

    checkCollisions();

    final redBalls = children.whereType<RedBall>().length;
    final blueBalls = children.whereType<BlueBall>().length;

    if (redBalls < 4) {
      spawnRedBall();
    }

    if (blueBalls < 4) {
      spawnBlueBall();
    }
  }

  void checkCollisions() {
    final redBalls = children.whereType<RedBall>().toList();
    final blueBalls = children.whereType<BlueBall>().toList();

    for (final red in redBalls) {
      for (final blue in blueBalls) {
        if (areBallsColliding(red, blue)) {
          red.removeFromParent();
          blue.removeFromParent();
          print('Удалены красный и синий шары!');
        }
      }
    }
  }

  bool areBallsColliding(Ball ball1, Ball ball2) {
    return ball1.toRect().overlaps(ball2.toRect());
  }
}
