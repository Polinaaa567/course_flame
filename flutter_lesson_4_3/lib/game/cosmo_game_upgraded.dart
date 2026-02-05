import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame_bloc/flame_bloc.dart';

import 'package:flutter_lesson_4_3/game/components/asteroid.dart';
import 'package:flutter_lesson_4_3/game/components/asteroid_enemy.dart';
import 'package:flutter_lesson_4_3/game/components/asteroid_healer.dart';
import 'package:flutter_lesson_4_3/game/components/player.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_bloc.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_state.dart';

class CosmoGameUpgraded extends FlameGame {
  @override
  Color backgroundColor() => Colors.grey[900]!;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final player = Player()..position = Vector2(size.x / 2, size.y / 2);
    add(
      FlameBlocProvider<PlayerBloc, PlayerState>(
        create: () => PlayerBloc(),
        children: [player],
      ),
    );

    add(Asteroid(Colors.yellow)..position = Vector2(100, size.y / 2));
    add(Asteroid(Colors.yellow)..position = Vector2(300, size.y / 2));
    add(AsteroidEnemy(Colors.red)..position = Vector2(300, size.y / 2 - 100));
    add(AsteroidEnemy(Colors.red)..position = Vector2(100, size.y / 2 - 100));
    add(AsteroidHealer(Colors.green)..position = Vector2(150, size.y / 2 - 300));
  }
}
