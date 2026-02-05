import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class Wall extends BodyComponent {
  final Vector2 start;
  final Vector2 end;

  Wall(this.start, this.end)
    : super(paint: Paint()..color = Colors.indigoAccent);

  @override
  Body createBody() {
    final shape = EdgeShape()..set(start, end);

    final fixturDef = FixtureDef(shape);
    final bodyDef = BodyDef(userData: this, position: start);

    return world.createBody(bodyDef)..createFixture(fixturDef);
  }
}
