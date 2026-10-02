import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.color, required this.txt, required this.onPressed});
  final Color color;
  final String txt;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
      child: Text(txt, style: TextStyle(color: Theme.of(context).primaryColorDark)),
    );
  }
}
