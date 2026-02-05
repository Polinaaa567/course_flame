import 'dart:async';
import 'dart:math';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lesson_4_1/game/asteroid.dart';
import 'package:lesson_4_1/game/player.dart';

class CosmoGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.purpleAccent.shade100;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    add(Player()..position = Vector2(size.x / 2, size.y / 2));
    // Непосредственно во время запуска игры, например музыка, картинка, первичная логика игры, во время запуска
    // сначала у нас запускается игра onLoad потом onMount (обработчик, который говорит что наш виджет встроился в дерево и мы можем с ним работать), после этого вызывается update (отрисовка нового фрейма)
  }

  // мы переходим к новому тику
  @override
  void update(double dt) {
    super.update(dt);

    if (getCountAsteroid() < 3) {
      spawnAsteroid();
    }
  }

  // отрисовать новый ui
  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Asteroids ${getCountAsteroid()}',
        style: TextStyle(color: Colors.cyanAccent, fontSize: 20),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, const Offset(40, 40));
    // canvas.drawCircle(Offset.zero, size.x / 2, Paint()..color = Colors.lime);
    // canvas.drawCircle(
    //   Offset(size.x / 2, size.y / 2),
    //   size.x / 2,
    //   Paint()..color = Colors.lime,
    // );
  }

  int getCountAsteroid() {
    final asteroids = children.whereType<Asteroid>();
    return asteroids.length;
  }

  void spawnAsteroid() {
    add(Asteroid()..position = getRandomBorderPosition(size.x, size.y));
  }
}

Vector2 getRandomBorderPosition(double width, double height) {
  var random = Random();
  var size = random.nextInt(4);
  late Vector2 position;

  switch (size) {
    case 0:
      position = Vector2(random.nextDouble() * width, 0);
    case 1:
      position = Vector2(width, random.nextDouble() * height);
    case 2:
      position = Vector2(random.nextDouble() * width, height);
    case 3:
      position = Vector2(0, random.nextDouble() * height);
      break;
  }
  return position;
}
