import 'package:flame/components.dart';

class Joystick extends JoystickComponent {

  final String text;
  final Sprite joystickKnob;
  final Sprite joystickBackground;

  Joystick({
    required this.joystickKnob,
    required this.joystickBackground,
    required this.text,
  }) : super(
         knob: SpriteComponent(
           sprite: joystickKnob,
           size: Vector2.all(60.0),
           priority: 999,
         ),
         background: SpriteComponent(
           sprite: joystickBackground,
           size: Vector2.all(100),
         ),
       ) {
    add(TextComponent(
      text: text, 
      position: Vector2(0, -100)
    ));
  }
}
