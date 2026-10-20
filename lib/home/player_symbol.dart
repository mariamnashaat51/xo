import 'package:flutter/material.dart';
import 'package:xo/style/app_color.dart';

class PlayerSymbol extends StatelessWidget {
  String symbol;
  VoidCallback onSymbolClick;

  PlayerSymbol({required this.symbol, required this.onSymbolClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onSymbolClick,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.all(39),
          child: Image.asset('assets/images/$symbol.png'),
        ),
      ),
    );
  }
}
