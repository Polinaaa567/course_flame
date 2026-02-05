import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lesson_7_collisions/game/components/obstacle_component.dart';
// import 'package:lesson_7_collisions/game/components/ball_components.dart';
import 'package:lesson_7_collisions/game/components/player.dart';

class GameCollisions extends FlameGame with HasCollisionDetection {
  @override
  Color backgroundColor() => Colors.blueGrey;

  @override
  FutureOr<void> onLoad() {
    // add(BallComponents()..position = Vector2(size.x/2, size.y/2));
    // add(BallComponents()..position = Vector2(100, 100));
    add(PlayerComponent()..position = Vector2(size.x / 2, size.y / 2));
    add(ObstacleComponent()..position = Vector2(size.x / 2 - 150, size.y / 2));
    super.onLoad();
  }
}
