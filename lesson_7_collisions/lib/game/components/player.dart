import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerHitbox extends RectangleHitbox {
  PlayerHitbox({super.size, super.anchor, super.position}) {
    triggersParentCollision = false;
  }
}

class PlayerPoligonHitbox extends PolygonHitbox {
  PlayerPoligonHitbox(super.vertices) {
    triggersParentCollision = false;
  }
}

class PlayerComponent extends RectangleComponent {
  late final PlayerHitbox playerHitbox;
  late final PlayerPoligonHitbox playerPoligonHitbox;

  @override
  bool get debugMode => true;

  @override
  FutureOr<void> onLoad() {
    size = Vector2(60, 50);
    paint = Paint()..color = Colors.transparent;

    playerHitbox = PlayerHitbox(
      size: Vector2(30, 50),
      anchor: Anchor.topCenter,
    );
    // add(playerHitbox);

    // ----------
    Vector2 innerOffset = Vector2(10, 10);

    playerPoligonHitbox = PlayerPoligonHitbox([
      Vector2(0 + innerOffset.x, 0 + innerOffset.y),
      Vector2(60 - innerOffset.x, 0 + innerOffset.y),
      Vector2(60 - innerOffset.x, 50 - innerOffset.y),
      Vector2(0 + innerOffset.x, 50 - innerOffset.y),
    ]);

    add(playerPoligonHitbox);
    super.onLoad();
  }

  @override
  void update(double dt) {
    position.x--;
    super.update(dt);
  }
}
