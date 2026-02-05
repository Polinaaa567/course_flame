import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:homework_lesson_7/game/components/ball.dart';

class RedBall extends Ball {
  RedBall() : super(paint: Paint()..color =Colors.red, size: Vector2.all(30));
}
