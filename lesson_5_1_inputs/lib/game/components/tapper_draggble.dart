import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:lesson_5_1_inputs/game/components/tapper.dart';

class TapperDraggble extends Tapper with DragCallbacks {
  late final defaultColor;
  bool _isDragged = false;

  TapperDraggble(super.color, super.text, super.size);

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);

    _isDragged = true;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    _isDragged = false;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position += event.localDelta;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);

    paint.color = isDragged ? Colors.red : Colors.purple;
  }
}
