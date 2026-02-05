import 'package:flame/components.dart';

class Joystick extends JoystickComponent {
  Sprite joystickSprite;
  Sprite joystickBackground;

  Joystick({required this.joystickSprite, required this.joystickBackground})
    : super(
        position: Vector2(0, 0),
        knob: SpriteComponent(sprite: joystickSprite, size: Vector2.all(50.0)),
        background: SpriteComponent(
          sprite: joystickBackground,
          size: Vector2.all(100.0),
        ),
        priority: 999,
      );
}
