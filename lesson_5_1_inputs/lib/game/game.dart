import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:lesson_5_1_inputs/game/components/joystick.dart';
import 'package:lesson_5_1_inputs/game/components/tapper_draggble.dart';
import 'package:lesson_5_1_inputs/game/components/tapper_gesture.dart';
import 'package:lesson_5_1_inputs/game/components/tapper_joystick.dart';
import 'package:lesson_5_1_inputs/game/components/tapper_keybord.dart';

class MyGame extends FlameGame with KeyboardEvents {
  @override
  Color backgroundColor() => Colors.grey;

  late Joystick joystick;
  late TapperJoystick joystickTapper;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    world.add(
      TapperGesture(Colors.blue, 'Gesture', Vector2.all(30.0))
        ..position = Vector2(size.x / 2, size.y / 2),
    );
    world.add(
      TapperDraggble(Colors.purple, 'Drag', Vector2.all(50.0))
        ..position = Vector2(size.x / 2, size.y / 2 - 200),
    );
    world.add(
      TapperKeybord(Colors.green, 'Keyboard', Vector2.all(50.0))
        ..position = Vector2(size.x / 2, size.y / 2 + 200),
    );

    joystick = Joystick(
      joystickSprite: await loadSprite('joystick_small_circle.png'),
      joystickBackground: await loadSprite('joystick_big_circle.png'),
    );

    joystickTapper = TapperJoystick(
      Colors.pink,
      'Joystick',
      Vector2.all(50.0),
      joystick,
    )..position = Vector2(size.x / 2 + 150, size.y / 2 + 200);

    world.add(joystickTapper);

    camera.viewport.add(
      joystick..position = Vector2(size.x - 100, size.y - 100),
    );
    camera.viewport.anchor = Anchor.topLeft;
    camera.follow(joystickTapper);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
        firstChild<TapperKeybord>()?.moveUp();
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
        firstChild<TapperKeybord>()?.moveLeft();
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
        firstChild<TapperKeybord>()?.moveDown();
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
        firstChild<TapperKeybord>()?.moveRight();
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyE)) {
        firstChild<TapperKeybord>()?.moveIdle();
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }
}

enum MovingDirection { up, left, right, down, idle }
