import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_bloc.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_event.dart';
import 'package:flutter_lesson_4_3/player_bloc/player_state.dart';

class Player extends RectangleComponent
    with FlameBlocReader<PlayerBloc, PlayerState> {
  late final TextComponent _textComponent;

  Player() : super(size: Vector2.all(30.0)) {
    paint = Paint()..color = Colors.blue;
    _textComponent = TextComponent(
      text: 'н',
      textRenderer: TextPaint(
        style: TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    );
    add(_textComponent);
  }

  @override
  void update(double dt) {
    final hp = bloc.state.when(alive: (hp, points) => hp, dead: (points) => 0);
    final points = bloc.state.when(
      alive: (hp, points) => points,
      dead: (points) => points,
    );

    _textComponent.text = 'HP: $hp, Points: $points';
  }

  void takeHit(int damage) {
    bloc.add(PlayerDamageEvent(damage: damage));
  }

  void decreasePoint() {
    bloc.add(PlayerDecreasePointEvent());
  }

  void heals(int heal) {
    bloc.add(PlayerHealEvent(heal: heal));

  }
}
