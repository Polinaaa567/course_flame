import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ObstacleComponent extends RectangleComponent with HasGameReference {
  @override
  bool get debugMode => true;

  late RectangleHitbox obstacleHitbox;

  @override
  FutureOr<void> onLoad() {
    size = Vector2(60, 50);
    paint = Paint()..color = Colors.red;

    obstacleHitbox = RectangleHitbox(
      size: Vector2(60, 50),
      anchor: Anchor.centerRight,
      position: size / 2,
    );

    add(obstacleHitbox);
    super.onLoad();
  }

  @override
  void update(double dt) {
    if (obstacleHitbox.isColliding) {
      paint = Paint()..color = Colors.green;
    } else {
      paint = Paint()..color = Colors.red;

    }

    // TODO: implement update
    super.update(dt);
  }
}
