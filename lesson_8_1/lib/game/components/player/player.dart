import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:lesson_8_1/game/components/zones/zone.dart';

class Player extends BodyComponent with ContactCallbacks {
  Player({
    required this.size,
    required this.pos,
    required this.getZoneEnumByGameCoords,
  });

  final double size;
  final Vector2 pos;

  late final CircleComponent circleComponent;

  final ZoneEnum Function(double x, double y) getZoneEnumByGameCoords;
  @override
  Future<void> onLoad() {
    priority = 99;
    circleComponent = CircleComponent()
      ..radius = size
      ..anchor = Anchor.center;

    add(circleComponent);

    return super.onLoad();
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      angularDamping: 0.8, //степень вращения
      position: pos,
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = size;
    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = 0.1
      ..restitution = 0.1;

    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(0)
      ..linearDamping = 2.0;
  }

  void increaseScore() {
    // добавление очков
    body.angularVelocity = 4;
  }

  double difficultForMoving = 1;
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    final currZone = getZoneEnumByGameCoords(position.x, position.y);

    switch (currZone) {
      case ZoneEnum.winter:
        difficultForMoving = 2;
        break;
      case ZoneEnum.water:
        difficultForMoving = 0.5;
        break;
      case ZoneEnum.earth:
        difficultForMoving = 1;
        break;
    }
  }
}
