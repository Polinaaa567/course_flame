import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lesson_8_1/blocs/game_bloc/game_bloc.dart';
import 'package:lesson_8_1/game_screen.dart';

void main() => runApp(
  BlocProvider(create: (context) => GameBloc(), child: const MainApp()),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('interesting game. welcome '),
            MaterialButton(
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => GameScreen())),
              color: Colors.blue,
              child: Text('enter the game'),
            ),
          ],
        ),
      ),
    );
  }
}
