import 'dart:async';
import 'dart:math';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame_7_3_forge2d/game/components/plus_ball.dart';
import 'package:flame_7_3_forge2d/game/components/joystick/joystick.dart';
import 'package:flame_7_3_forge2d/game/components/joystick/player_ball_joystick.dart';
import 'package:flame_7_3_forge2d/game/components/wall.dart';
import 'package:flame_7_3_forge2d/game/components/plus_ball_spawner.dart';


class MyGameForge2d extends Forge2DGame {
  MyGameForge2d() : super(gravity: Vector2(00, 00));

  @override
  FutureOr<void> onLoad() async {
    final List<Wall> walls = createWalls();
    walls.forEach(add);

    final joystick = Joystick(
      joystickSprite: await loadSprite('joystick_small_circle.png'),
      joystickBackground: await loadSprite('joystick_big_circle.png'),
    );

    final joystick2 = Joystick(
      joystickSprite: await loadSprite('joystick_small_circle.png'),
      joystickBackground: await loadSprite('joystick_big_circle.png'),
    );

    final playerBallJoystick2 = PlayerBallJoystick(
      radius: 30,
      joystick: joystick2,
    );

    final playerBallJoystick = PlayerBallJoystick(
      radius: 30,
      joystick: joystick,
    );
    add(playerBallJoystick);
    add(playerBallJoystick2);

    camera.viewport.add(
      joystick..position = Vector2(size.x * (1 - 0.23), size.y - 100),
    );

    camera.viewport.add(joystick2..position = Vector2(size.x * (0.23), 100));

    add(PlusBallSpawner());

    return super.onLoad();
  }

  List<Wall> createWalls() {
    final vp = camera.viewport;
    final Vector2 screenSize = Vector2(vp.size.x, vp.size.y);

    return [
      Wall(Vector2(0, 0), Vector2(screenSize.x, 0)),
      Wall(Vector2(0, 0), Vector2(0, screenSize.y)),
      Wall(
        Vector2(screenSize.x / 2, 0),
        Vector2(screenSize.x / 2, screenSize.y),
      ),
      Wall(
        Vector2(0, screenSize.y / 2),
        Vector2(screenSize.x, screenSize.y / 2),
      ),
    ];
  }

  void spawnPlusBall() {
    final random = Random();

  final plusBall = PlusBall(
      position: Vector2(
        random.nextDouble() * (size.x - 100) + 50,
        random.nextDouble() * (size.y - 100) + 50,
      ),
    );
    add(plusBall);
  }

  int getCountPlusBall() {
    final plusBalls = children.whereType<PlusBall>();
    return plusBalls.length;
  }
}
