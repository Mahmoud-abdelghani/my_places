import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CategoryContainder extends StatelessWidget {
  const CategoryContainder({super.key, required this.onTap, required this.isPressed, required this.txt});
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
          color: isPressed ? Color(0xff14B8A6) : Color(0xff334155),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          txt,
          style: TextStyle(
            color: isPressed ? Colors.white : Color(0xff5EEAD4),
            fontSize: ScreenSize.height * 0.028,
          ),
        ),
      ),
    );
  }
}
