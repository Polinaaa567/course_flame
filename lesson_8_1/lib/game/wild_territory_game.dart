import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_bloc.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_event.dart';
import 'package:lesson_8_1/game/components/enemy.dart';

import 'package:lesson_8_1/game/components/joystick/joystick.dart';
import 'package:lesson_8_1/game/components/joystick/player_joystick.dart';
import 'package:lesson_8_1/game/components/player/player_wizard.dart';
import 'package:lesson_8_1/game/components/wall.dart';
import 'package:lesson_8_1/game/components/zones/zone.dart';

class WildTerritoryGame extends Forge2DGame {
  WildTerritoryGame({required this.gameBloc}) : super(gravity: Vector2(0, 0));
  @override
  Color backgroundColor() => Colors.grey[800]!;

  final GameBloc gameBloc;

  static const double worldScale = 1.0;
  Vector2 gamingSize = Vector2(64, 64);

  late PlayerJoystick myPlayerJoystick;

  List<List<double>> terrain = [];
  @override
  FutureOr<void> onLoad() async {
    camera.viewfinder.position = -gamingSize / 2;
    camera.viewport.add(FpsTextComponent());
    createSimpleTerraria();
    super.onLoad();

    final joystick = Joystick(
      joystickKnob: await loadSprite('joystick_small_circle.png'),
      joystickBackground: await loadSprite('joystick_big_circle.png'),
      text: 'Joystick',
    );

    myPlayerJoystick = PlayerWizard(
      joystick: joystick,
      size: 1,
      pos: Vector2.all(-32),
      joystickMaxSpeed: 0.4,
      getZoneEnumByGameCoords: getZoneEnumByGameCoords,
    );
    world.add(myPlayerJoystick);

    camera.viewport.add(
      joystick..position = Vector2(size.x * 0.5, size.y - 100),
    );

    world.addAll(createWalls());
  }

  int await = 100;

  @override
  void update(double dt) {
    await--;
    if (await == 0) {
      camera.follow(myPlayerJoystick);
    }
    super.update(dt);
  }

  void createSimpleTerraria() {
    int xSize = gamingSize.x.round();
    int ySize = gamingSize.y.round();

    world.removeWhere((component) => component is Zone);
    terrain = List.generate(
      xSize,
      (_) => List.generate(ySize, (_) => -1 + Random().nextDouble() * 2),
    );

    for (int i = 0; i < terrain.length; i++) {
      for (int j = 0; j < terrain[i].length; j++) {
        Zone tempZone;
        double terrainWeight = terrain[i][j];

        if (terrainWeight > 0.535 && terrainWeight < 0.541) {
          world.add(
            Enemy(
              pos: Vector2(-xSize + j * worldScale, -ySize + i * worldScale),
              size: Vector2.all(1),
              increasePointInGame: increaseScoreInGame,
              decreasePointInGame: decreaseScoreInGame,
            ),
          );
        }
        if (terrainWeight > 0.5) {
          tempZone = WinterZone(
            pos: Vector2(-xSize + j * worldScale, -ySize + i * worldScale),
            sizeComp: Vector2(worldScale, worldScale),
          );
          tempZone.setColor(Colors.white70);
          world.add(tempZone);
        } else if (-0.5 <= terrainWeight && terrainWeight <= 0.5) {
          tempZone = EarthZone(
            pos: Vector2(-xSize + j * worldScale, -ySize + i * worldScale),
            sizeComp: Vector2(worldScale, worldScale),
          );
          tempZone.setColor(Colors.lightGreen);
          world.add(tempZone);
        } else if (terrainWeight < -0.5) {
          tempZone = WaterZone(
            pos: Vector2(-xSize + j * worldScale, -ySize + i * worldScale),
            sizeComp: Vector2(worldScale, worldScale),
          );
          tempZone.setColor(Colors.blueAccent);
          world.add(tempZone);
        }
      }
    }
  }

  ZoneEnum getZoneEnumByGameCoords(double x, double y) {
    int leftCorner = gamingSize.x.round();
    int topCorner = gamingSize.y.round();

    int matrixOffsetX = (topCorner + y).round();
    int matrixOffsetY = (leftCorner + x).round();

    double terrainWeight = terrain[matrixOffsetX][matrixOffsetY];
    if (terrainWeight > 0.5) {
      return ZoneEnum.winter;
    } else if (-0.5 <= terrainWeight && terrainWeight <= 0.5) {
      return ZoneEnum.earth;
    } else if (terrainWeight < -0.5) {
      return ZoneEnum.water;
    }
    return ZoneEnum.earth;
  }

  List<Component> createWalls() {
    double scale = worldScale - 1;
    final topLeft = Vector2(-gamingSize.x, -gamingSize.y);
    final topRight = Vector2(gamingSize.x * scale, -gamingSize.y);
    final bottomLeft = Vector2(gamingSize.x * scale, gamingSize.y * scale);
    final bottomRight = Vector2(-gamingSize.x, gamingSize.y * scale);

    return [
      Wall(topLeft, topRight),
      Wall(topRight, bottomLeft),
      Wall(bottomLeft, bottomRight),
      Wall(topLeft, bottomRight),
    ];
  }

  void increaseScoreInGame() {
    gameBloc.add(const GameIncreasePointEvent());
  }

  void decreaseScoreInGame() {
    gameBloc.add(const GameDecreasePointEvent());
  }
}
