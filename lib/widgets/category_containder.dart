import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CategoryContainder extends StatelessWidget {
  const CategoryContainder({
    super.key,
    required this.onTap,
    required this.isPressed,
    required this.txt,
  });
  final VoidCallback onTap;
  final bool isPressed;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isPressed
              ? Theme.of(context).primaryColor
              : Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          txt,
          style: TextStyle(
            color: isPressed
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColor,
            fontSize: ScreenSize.height * 0.028,
          ),
        ),
      ),
    );
  }
}
