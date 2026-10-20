import 'package:flutter/material.dart';
import 'package:xo/home/board_button.dart';
import 'package:xo/home/game_screen_args.dart';
import 'package:xo/style/app_color.dart';

class GameScreenBoard extends StatefulWidget {
  static const String routeName = 'GameScreen';

  @override
  State<GameScreenBoard> createState() => _GameScreenBoardState();
}

class _GameScreenBoardState extends State<GameScreenBoard> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int playerXScore = 0;
  int playerOScore = 0;
  String title = 'Player 1 Turn';

  late GameScreenArgs args;

  @override
  Widget build(BuildContext context) {
    // todo: casting => (object? => GameScreenArgs)
    args = ModalRoute.of(context)!.settings.arguments as GameScreenArgs;
    return Scaffold(
      backgroundColor: AppColor.transparentColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.cyanColor, AppColor.blueColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 32,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: AppColor.whiteColor,
                    color: AppColor.playerColor,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Player1 ${args.player1Symbol}',
                            style: TextStyle(
                              // color: AppColor.xColor,
                              color: AppColor.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Score: $playerXScore',
                            style: TextStyle(
                              // color: AppColor.xColor,
                              color: AppColor.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Player2 ${args.player2Symbol}',
                            style: TextStyle(
                              // color: AppColor.oColor,
                              color: AppColor.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Score: $playerOScore',
                            style: TextStyle(
                              // color: AppColor.oColor,
                              color: AppColor.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              BoardButton(
                                symbol: boardState[0],
                                index: 0,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[1],
                                index: 1,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[2],
                                index: 2,
                                onGameButtonClick: onGameClick,
                              ),
                            ],
                          ),
                        ),

                        Divider(color: Colors.black, thickness: 1),

                        Expanded(
                          child: Row(
                            children: [
                              BoardButton(
                                symbol: boardState[3],
                                index: 3,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[4],
                                index: 4,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[5],
                                index: 5,
                                onGameButtonClick: onGameClick,
                              ),
                            ],
                          ),
                        ),

                        Divider(color: Colors.black, thickness: 1),

                        Expanded(
                          child: Row(
                            children: [
                              BoardButton(
                                symbol: boardState[6],
                                index: 6,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[7],
                                index: 7,
                                onGameButtonClick: onGameClick,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              BoardButton(
                                symbol: boardState[8],
                                index: 8,
                                onGameButtonClick: onGameClick,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 0 => x
  /// 1 => o
  /// 2 => x
  /// 3=> o
  /// 4 => x
  /// 5 => o
  /// 6=> x
  /// 7=> o
  /// 8 => x

  int counter = 0;
  void onGameClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      // turn x
      boardState[index] = args.player1Symbol;
      title = 'Player 2 Turn';
    } else {
      // turn o
      boardState[index] = args.player2Symbol;
      title = 'Player 1 Turn';
    }
    counter++;
    if (checkWinner(args.player1Symbol)) {
      // todo: x ==> win
      title = 'Player 1 Win';
      playerXScore++;
      Future.delayed(Duration(seconds: 1), initBoard);
      // Future.delayed(Duration(seconds: 1), () => initBoard());
      // initBoard();
      // todo: alert dialog, toast, snack bar
      dialog();
    } else if (checkWinner(args.player2Symbol)) {
      // todo: o ==> win
      title = 'Player 2 Win';
      playerOScore++;
      Future.delayed(Duration(seconds: 1), initBoard);
      // Future.delayed(Duration(seconds: 1), () => initBoard());
      // initBoard();
      // todo: alert dialog, toast, snack bar
      dialog();
    } else if (counter == 9) {
      title = 'None of Players Win';
      Future.delayed(Duration(seconds: 1), initBoard);
      // Future.delayed(Duration(seconds: 1), () => initBoard());
      // initBoard();
      // todo: alert dialog, toast, snack bar
      dialog();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    /// todo: Row
    // if (boardState[0] == symbol &&
    //     boardState[1] == symbol &&
    //     boardState[2] == symbol) {
    //   return true;
    // }
    // if (boardState[3] == symbol &&
    //     boardState[4] == symbol &&
    //     boardState[5] == symbol) {
    //   return true;
    // }
    // if (boardState[6] == symbol &&
    //     boardState[7] == symbol &&
    //     boardState[9] == symbol) {
    //   return true;
    // }
    ///todo: i = 0 => 0 , 1, 2
    ///todo: i = 3 => 3 , 4, 5
    ///todo: i = 6 => 6 ,7,8
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    /// todo: Columns
    // if (boardState[0] == symbol &&
    //     boardState[3] == symbol &&
    //     boardState[6] == symbol) {
    //   return true;
    // }
    // if (boardState[1] == symbol &&
    //     boardState[4] == symbol &&
    //     boardState[7] == symbol) {
    //   return true;
    // }
    // if (boardState[2] == symbol &&
    //     boardState[5] == symbol &&
    //     boardState[8] == symbol) {
    //   return true;
    // }
    ///todo: i = 0 => 0, 3, 6
    ///todo: i = 1 => 1, 4, 7
    ///todo: i = 0 => 2, 5, 8
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    title = 'Player 1 Turn';
    setState(() {});
  }

  void dialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.cyanColor,
        title: Text(
          title,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Continue',
              style: TextStyle(color: AppColor.oColor, fontSize: 12),
            ),
          ),

          TextButton(
            onPressed: () {
              initBoard();
              playerOScore = 0;
              playerXScore = 0;
              Navigator.pop(context);
            },
            child: Text(
              'Restart',
              style: TextStyle(color: AppColor.xColor, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

/*  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      symbolTitle,
                      style: TextStyle(
                        color: symbolTitle == 'X'
                            ? AppColor.xColor
                            : AppColor.oColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '’s $symbolMode',
                      style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),*/
