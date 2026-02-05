import 'package:flutter_lesson_4_3/game/components/asteroid.dart';
import 'package:flutter_lesson_4_3/game/components/player.dart';

class AsteroidHealer extends Asteroid {
  AsteroidHealer(super.color);

  @override
  void onPlayerCollision(Player player) {
    removeFromParent();
    player.heals(5);
  }
}
