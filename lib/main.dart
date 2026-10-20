import 'package:flutter/material.dart';
import 'package:xo/home/game_screen_board.dart';
import 'package:xo/home/player_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        GameScreenBoard.routeName: (context) => GameScreenBoard(),
      },
    );
  }
}
