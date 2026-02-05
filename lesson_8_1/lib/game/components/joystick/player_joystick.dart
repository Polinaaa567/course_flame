import 'package:flame/input.dart';

import 'package:lesson_8_1/game/components/joystick/joystick.dart';
import 'package:lesson_8_1/game/components/player/player.dart';

class PlayerJoystick extends Player {
  final double joystickMaxSpeed;
  final Joystick joystick;

  PlayerJoystick({
    required this.joystick,
    required super.size,
    required super.pos,
    required this.joystickMaxSpeed,
    required super.getZoneEnumByGameCoords,
  });

  @override
  void update(double dt) {
    super.update(dt);

    if (joystick.delta != Vector2.zero()) {
      final impulse = Vector2(joystick.delta.x, joystick.delta.y)
        ..scale(joystickMaxSpeed / difficultForMoving);

      body.applyLinearImpulse(impulse);
    }
  }
}
