import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:lesson_8_1/game/components/elements/bullet_element.dart';
import 'package:lesson_8_1/game/components/joystick/player_joystick.dart';

class PlayerWizard extends PlayerJoystick with TapCallbacks {
  PlayerWizard({
    required super.joystick,
    required super.size,
    required super.pos,
    required super.joystickMaxSpeed,
    required super.getZoneEnumByGameCoords,
  });

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    final tapPos = event.localPosition;
    final impulse = Vector2(tapPos.x, tapPos.y)..scale(100.0);

    final offset = (impulse.normalized() * 3 * size) + position;

    final bullet = BulletElement(
      pos: offset,
      size: Vector2.all(0.5),
      vectorForMoving: impulse,
    );

    world.add(bullet);
  }
}
