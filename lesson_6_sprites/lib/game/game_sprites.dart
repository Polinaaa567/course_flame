import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flame/image_composition.dart' as img;
import 'package:rive/rive.dart';

class GameSprites extends FlameGame with TapCallbacks {
  @override
  Color backgroundColor() => Colors.grey[800]!;

  late final SpriteAnimationComponent spriteAnimationComponent;
  // late final SMINumber statusNumber;

  @override
  Future<void> onLoad() async {
    img.Image robotImage = await images.load('robot.png');
    Robot robot = Robot(robotImage: robotImage);
    add(robot);

    //------ Anim Sprite

    img.Image catImage = await images.load('cat.png');

    var catSequencesAnimationData = SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.12,
      textureSize: Vector2(224, 280),
      amountPerRow: 4,
    );

    var catSpriteAnimation = SpriteAnimation.fromFrameData(
      catImage,
      catSequencesAnimationData,
    );
    spriteAnimationComponent = SpriteAnimationComponent(
      animation: catSpriteAnimation,
    );

    add(spriteAnimationComponent);

    // ----- RIVE Animation

    final skillsArtboard = await loadArtboard(
      RiveFile.asset('assets/cloudy-walk.riv'),
    );
    final controller = StateMachineController.fromArtboard(
      skillsArtboard,
      'StateMachine',
    );
    if (controller != null) {
      skillsArtboard.addController(controller);
      print(skillsArtboard.stateMachines);
    
    
    // statusNumber = controller.findSMI('Level');
      // print('statusNumber.value: ${statusNumber.value}');
      add(RiveComponent(artboard: skillsArtboard, size: Vector2.all(300.0)));
    } else {
      print('Контроллер не найден. Доступные state machines:');
      print(skillsArtboard.stateMachines);
    } 
    
    // statusNumber = controller.findSMI('Level');
    // print('statusNumber.value: ${statusNumber.value}');
    add(RiveComponent(artboard: skillsArtboard, size: Vector2.all(300.0)));

    super.onLoad();
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   super.onTapDown(event);

  //   switch (statusNumber.value) {
  //     case 0:
  //       statusNumber.value = 1;
  //       break;
  //     case 1:
  //       statusNumber.value = 2;
  //       break;
  //     case 2:
  //       statusNumber.value = 0;
  //       break;
  //   }
  // }
}

class Robot extends SpriteComponent {
  Robot({required this.robotImage})
    : super(sprite: Sprite(robotImage), scale: Vector2.all(0.3));
  img.Image robotImage;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
  }
}
