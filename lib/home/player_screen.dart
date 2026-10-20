import 'package:flutter/material.dart';
import 'package:xo/home/game_screen_args.dart';
import 'package:xo/home/game_screen_board.dart';
import 'package:xo/home/player_symbol.dart';
import 'package:xo/style/app_color.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Pick who goes first?',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 18.0,
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    PlayerSymbol(
                      symbol: 'X',
                      onSymbolClick: () {
                        Navigator.of(context).pushNamed(
                          GameScreenBoard.routeName,
                          arguments: GameScreenArgs(
                            player1Symbol: 'X',
                            player2Symbol: 'O',
                          ),
                        );
                      },
                    ),
                    PlayerSymbol(
                      symbol: 'O',
                      onSymbolClick: () {
                        Navigator.of(context).pushNamed(
                          GameScreenBoard.routeName,
                          arguments: GameScreenArgs(
                            player1Symbol: 'O',
                            player2Symbol: 'X',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: EdgeInsets.all(39),
                          child: Image.asset('assets/images/X.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: EdgeInsets.all(39),
                          child: Image.asset('assets/images/O.png'),
                        ),
                      ),
                    ),*/
