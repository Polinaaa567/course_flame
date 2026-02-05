import 'package:flame/components.dart';

class Joystick extends JoystickComponent {
  late final Sprite joystickSprite;
  late final Sprite joystickBackground;

  Joystick({required this.joystickSprite, required this.joystickBackground})
    : super(
        knob: SpriteComponent(sprite: joystickSprite, size: Vector2.all(80.0),
          priority: 999,
        ),
        background: SpriteComponent(
          sprite: joystickBackground,
          size: Vector2.all(100.0),
        ),
      );
}
