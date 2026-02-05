import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lesson_8_1/blocs/game_bloc/game_bloc.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_event.dart';
import 'package:lesson_8_1/blocs/game_bloc/game_state.dart';
import 'package:lesson_8_1/game/wild_territory_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GameBloc>(context).add(const GameStartEvent());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GameWidget(
              game: WildTerritoryGame(
                gameBloc: BlocProvider.of<GameBloc>(context),
              ),
            ),

            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                return state.maybeWhen(
                  gaming: (points) => Text(
                    'Score = $points',
                    style: TextStyle(color: Colors.yellow, fontSize: 40.0),
                  ),
                  gameOver: (points) => SizedBox.shrink(),
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
            BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                return state.maybeWhen(
                  gameOver: (points) => Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Game Over points = $points',
                      style: TextStyle(color: Colors.yellow, fontSize: 35.0),
                    ),
                  ),

                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
