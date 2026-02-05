import 'package:flame/components.dart';

import 'package:flame_7_3_forge2d/game/game_forge2d.dart';

class PlusBallSpawner extends Component with HasGameReference<MyGameForge2d> {
  late Timer _spawnTimer;

  @override
  Future<void> onLoad() async {
    _spawnTimer = Timer(
      2,
      onTick: () {
        if (game.getCountPlusBall() < 4) {
          game.spawnPlusBall();
        }
      },
      repeat: true,
    );

    if (game.getCountPlusBall() < 3) {
      game.spawnPlusBall();
    }
  }

  @override
  void update(double dt) {
    _spawnTimer.update(dt);
  }

  @override
  void onRemove() {
    _spawnTimer.stop();
  }
}
