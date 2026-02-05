import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BulletElement extends BodyComponent with ContactCallbacks {
  BulletElement({
    required this.pos,
    required this.size,
    required this.vectorForMoving,
  });

  final Vector2 pos;
  final Vector2 size;
  final Vector2 vectorForMoving;

  double alivingTime = 100;
  @override
  void update(double dt) {
    alivingTime--;
    if (alivingTime < 0) {
      removeFromParent();
    }

    super.update(dt);
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      angularDamping: 0.8,
      position: pos,
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = size.x;

    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = 0.1
      ..restitution = 0.1;

    return world.createBody(bodyDef)..createFixture(fixtureDef)
      ..angularVelocity = radians(0)
      ..applyLinearImpulse(vectorForMoving);
  }
}
