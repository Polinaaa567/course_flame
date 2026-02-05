import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:homework_lesson_7/game/components/ball.dart';

class BlueBall extends Ball {
  BlueBall()
    : super(paint: Paint()..color = Colors.blue, size: Vector2.all(30));
}
