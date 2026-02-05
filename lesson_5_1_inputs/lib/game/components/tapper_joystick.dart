import 'package:flame/input.dart';
import 'package:lesson_5_1_inputs/game/components/joystick.dart';
import 'package:lesson_5_1_inputs/game/components/tapper.dart';

enum JoystickState { idle, walk }

class TapperJoystick extends Tapper {
  TapperJoystick(super.color, super.text, super.size, this.joystick);

  final Joystick joystick;
  JoystickState joystickState = JoystickState.idle;

  static const double speed = 5;

  @override
  void update(double dt) {
    super.update(dt);

    if (joystick.direction != JoystickDirection.idle) {
      joystickState = JoystickState.walk;
      x += joystick.delta.x * speed * dt;
      y += joystick.delta.y * speed * dt;
    }
  }
}
