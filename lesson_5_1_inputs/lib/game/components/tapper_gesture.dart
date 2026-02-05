import 'package:flame/events.dart';
import 'package:lesson_5_1_inputs/game/components/tapper.dart';

class TapperGesture extends Tapper with TapCallbacks {
  TapperGesture(super.color, super.text, super.size);

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    jump();
  }
}