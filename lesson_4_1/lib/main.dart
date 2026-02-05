import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lesson_4_1/game/cosmo_game.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: GameWidget(game: CosmoGame())),
      ),
    );
  }
}
