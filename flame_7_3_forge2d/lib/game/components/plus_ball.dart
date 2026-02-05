import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import 'package:flame_7_3_forge2d/game/components/player_ball.dart';

class PlusBall extends BodyComponent with ContactCallbacks {
  final Vector2 position;
  final double radius = 15.0;

  PlusBall({required this.position})
    : super(paint: Paint()..color = Colors.lime);

  @override
  Body createBody() {
    final shape = CircleShape()..radius = radius;
    final fixtureDef = FixtureDef(shape)..isSensor = true;

    final bodyDef = BodyDef()
      ..type = BodyType.static
      ..userData = this
      ..position = position;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is PlayerBall) {
      Future.delayed(Duration(milliseconds: 10), () {
        if (isLoaded) {
          removeFromParent();
        }
      });
    }

    super.beginContact(other, contact);
  }
}
