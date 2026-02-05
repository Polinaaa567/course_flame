import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:lesson_8_1/game/components/elements/bullet_element.dart';

import 'package:lesson_8_1/game/components/player/player.dart';

class Enemy extends BodyComponent with ContactCallbacks {
  Enemy({
    required this.pos,
    required this.size,
    required this.increasePointInGame,
    required this.decreasePointInGame,
  });

  final VoidCallback increasePointInGame;
  final VoidCallback decreasePointInGame;

  double health = 100;
  final Vector2 pos;
  final Vector2 size;
  late RectangleComponent healthPosCom;

  @override
  Future<void> onLoad() async {
    healthPosCom = RectangleComponent()
      ..anchor = Anchor.center
      ..position = Vector2(0, -size.y * 1.5)
      ..size = Vector2(size.x * 1.6, size.y / 4);

    final paintCom = CircleComponent()
      ..radius = size.x
      ..position = Vector2(-size.x, -size.y);
    paintCom.paint = Paint()..color = Colors.red;

    add(paintCom);
    add(healthPosCom);
    super.onLoad();
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      angularDamping: 999,
      position: pos,
      type: BodyType.dynamic,
    );

    final shape = CircleShape()..radius = size.x;

    final fixtureDef = FixtureDef(shape)
      ..density = 5
      ..friction = .1
      ..restitution = .1;

    return world.createBody(bodyDef)
      ..createFixture(fixtureDef)
      ..angularVelocity = radians(0);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Player) {
      final DecreaseStatus status = decreaseHealth(20);
      if (status == DecreaseStatus.killed) {
        increasePointInGame();
      }
    }

    if (other is BulletElement) {
      final DecreaseStatus status = decreaseHealth(10);
      if (status == DecreaseStatus.killed) {
        increasePointInGame();
      }
    }

    super.beginContact(other, contact);
  }

  DecreaseStatus decreaseHealth(double value) {
    if (health - value > 0) {
      health -= value;
      healthPosCom.scale = Vector2(health / 100, 1);
      return DecreaseStatus.alive;
    } else {
      destroy();
      return DecreaseStatus.killed;
    }
  }

  void destroy() {
    world.remove(this);
  }

  List<double> offset = [0, 0, 0, 0];
  double scaleMoveForRandom = 1;

  void randomMove() {
    int dir = Random().nextInt(4);
    double move = -6 * Random().nextDouble() * 12;

    switch (dir) {
      case 0:
        body.applyLinearImpulse(Vector2(0, -move * scaleMoveForRandom));
        break;
      case 1:
        body.applyLinearImpulse(Vector2(-move * scaleMoveForRandom, 0));
        break;
      case 2:
        body.applyLinearImpulse(Vector2(0, move * scaleMoveForRandom));
        break;
      case 3:
        body.applyLinearImpulse(Vector2(move * scaleMoveForRandom, 0));
        break;
      default:
    }
  }

  double awaitForMove = 20;

  @override
  void update(double dt) {
    awaitForMove--;
    if (awaitForMove < 0) {
      awaitForMove = 20 + Random().nextDouble() * 30;
      randomMove();
    }
    super.update(dt);
  }
}

enum DecreaseStatus { killed, alive }
