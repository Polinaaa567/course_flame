import 'package:lesson_5_1_inputs/game/components/tapper.dart';
import 'package:lesson_5_1_inputs/game/game.dart';

class TapperKeybord extends Tapper {
  TapperKeybord(super.color, super.text, super.size);

  static const double movingSpeed = 70.0;
  static const double friction = 10;
  double movingVelocity = 10.0;

  MovingDirection movingDirection = MovingDirection.idle; // стоит
  @override
  void update(double dt) {
    super.update(dt);

    switch (movingDirection) {
      case MovingDirection.up:
        y -= movingVelocity * dt;
        break;
      case MovingDirection.down:
        y += movingVelocity * dt;
        break;
      case MovingDirection.left:
        x -= movingVelocity * dt;
        break;
      case MovingDirection.right:
        x += movingVelocity * dt;
        break;
      case MovingDirection.idle:
        break;
    }

    if (movingDirection != MovingDirection.idle) {
      movingVelocity -= friction * dt;
    }

    if (movingVelocity <= 0) {
      movingVelocity = movingSpeed;
      movingDirection = MovingDirection.idle;
    }
  }

  void moveUp() {
    movingDirection = MovingDirection.up;
    movingVelocity = movingSpeed;
  }

  void moveLeft() {
    movingDirection = MovingDirection.left;
    movingVelocity = movingSpeed;

  }

  void moveDown() {
    movingDirection = MovingDirection.down;
    movingVelocity = movingSpeed;

  }

  void moveRight() {
    movingDirection = MovingDirection.right;
    movingVelocity = movingSpeed;

  }

  void moveIdle() {
    movingDirection = MovingDirection.idle;
  }
}
