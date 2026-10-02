import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class PositionContainer extends StatelessWidget {
  const PositionContainer({super.key, required this.txt, required this.value});
  final String txt;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width * 0.43,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: ScreenSize.height * 0.02,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/Container.png'),
          ),

          Text(
            txt,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: ScreenSize.height * 0.015,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              color: Theme.of(context).dividerColor,
              fontSize: ScreenSize.height * 0.018,
            ),
          ),
        ],
      ),
    );
  }
}
