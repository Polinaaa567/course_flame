import 'dart:async';

import 'package:flame/components.dart';

enum ZoneEnum { winter, earth, water }

class Zone extends RectangleComponent {
  Zone({required this.pos, required this.sizeComp});

  Vector2 pos;
  Vector2 sizeComp;

  @override
  FutureOr<void> onLoad() {
    priority = -10;
    position = pos;
    size = sizeComp;
    return super.onLoad();
  }
}

class WinterZone extends Zone {
  WinterZone({required super.pos, required super.sizeComp});
}

class EarthZone extends Zone {
  EarthZone({required super.pos, required super.sizeComp});
}

class WaterZone extends Zone {
  WaterZone({required super.pos, required super.sizeComp});
}
