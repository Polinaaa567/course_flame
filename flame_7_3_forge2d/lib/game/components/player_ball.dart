import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import 'package:flame_7_3_forge2d/game/components/plus_ball.dart';

class PlayerBall extends BodyComponent with ContactCallbacks {
  PlayerBall({required this.radius})
    : super(paint: Paint()..color = Colors.green);

  final double _minRadius = 20.0;
  final double _minDensity = 0.1;

  bool _isProcessingContact = false;
  double density = 0.5;
  bool _needsFixtureUpdate = false;
  double _newRadius = 0;
  double _newDensity = 0;

  double radius;

  @override
  Future<void> onLoad() {
    debugMode = true;
    return super.onLoad();
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = radius;
    final fixtureDef = FixtureDef(shape)
      ..restitution = 0.8
      ..density = density;

    final bodyDef = BodyDef()
      ..type = BodyType.dynamic
      ..userData = this
      ..position = Vector2(100, 100);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  void _scheduleFixtureUpdate(double newRadius, double newDensity) {
    _needsFixtureUpdate = true;
    _newRadius = newRadius;
    _newDensity = newDensity;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_needsFixtureUpdate) {
      _updateFixture();
      _needsFixtureUpdate = false;
    }
  }

  void _updateFixture() {
    body.destroyFixture(body.fixtures.first);
    radius = _newRadius;
    density = _newDensity;

    final shape = CircleShape()..radius = radius;
    final fixtureDef = FixtureDef(shape)
      ..restitution = 0.8
      ..density = density;

    body.createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is PlayerBall && !_isProcessingContact) {
      final otherBall = other;

      _isProcessingContact = true;
      otherBall._isProcessingContact = true;

      if (radius > otherBall.radius) {
        final transferAmount = otherBall.radius * 0.1;
        final transferAmountDensity = otherBall.density * 0.1;

        final newRadius = radius + transferAmount;
        final newDensity = density + transferAmountDensity;

        final otherNewRadius = (otherBall.radius - transferAmount).clamp(
          _minRadius,
          double.infinity,
        );
        final otherNewDensity = (otherBall.density - transferAmountDensity)
            .clamp(_minDensity, double.infinity);

        _scheduleFixtureUpdate(newRadius, newDensity);
        otherBall._scheduleFixtureUpdate(otherNewRadius, otherNewDensity);

        print(
          'Больший шар увеличится до $newRadius и density = $newDensity, меньший уменьшится до $otherNewRadius и density = $otherNewDensity',
        );
      } else if (radius < otherBall.radius) {
        final transferAmount = radius * 0.1;
        final transferAmountDensity = density * 0.1;

        final otherNewRadius = otherBall.radius + transferAmount;
        final otherNewDensity = otherBall.density + transferAmountDensity;

        final newRadius = (radius - transferAmount).clamp(
          _minRadius,
          double.infinity,
        );
        final newDensity = (density - transferAmountDensity).clamp(
          _minDensity,
          double.infinity,
        );

        _scheduleFixtureUpdate(newRadius, newDensity);
        otherBall._scheduleFixtureUpdate(otherNewRadius, otherNewDensity);

        print(
          'Меньший шар уменьшится до $newRadius и density = $newDensity, больший увеличится до $otherNewRadius и density = $otherNewDensity',
        );
      }

      Future.delayed(Duration(milliseconds: 100), () {
        _isProcessingContact = false;
        otherBall._isProcessingContact = false;
      });
    } else if ( other is PlusBall) {
      _scheduleFixtureUpdate(radius + 10.0, density + 0.1);
    }

    super.beginContact(other, contact);
  }
}
