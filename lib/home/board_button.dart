import 'package:flutter/material.dart';

typedef OnGameButtonClick = void Function(int index);

class BoardButton extends StatelessWidget {
  String symbol;
  int index;
  OnGameButtonClick onGameButtonClick;
  BoardButton({
    required this.symbol,
    required this.index,
    required this.onGameButtonClick,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // todo: click
          onGameButtonClick(index);
        },
        child: symbol.isEmpty
            ? Container()
            : Image.asset('assets/images/$symbol.png'),
      ),
    );
  }
}
