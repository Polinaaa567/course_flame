import 'package:flame/game.dart';

import 'package:flame_7_3_forge2d/game/components/joystick/joystick.dart';
import 'package:flame_7_3_forge2d/game/components/player_ball.dart';

class PlayerBallJoystick extends PlayerBall {
  PlayerBallJoystick({required super.radius, required this.joystick});

  final Joystick joystick;

  @override
  void update(double dt) {
    super.update(dt);

    if (joystick.delta != Vector2.zero()) {
      final impulse = Vector2(joystick.delta.x, joystick.delta.y)..scale(100.0);
      body.applyLinearImpulse(impulse);
    }
  }
}
