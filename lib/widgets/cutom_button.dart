import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({super.key, required this.onPressed, required this.txt});
final VoidCallback onPressed;
final String txt;
  @override

  Widget build(BuildContext context) {
    return MaterialButton(
                   onPressed: onPressed,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    color: Color(0xff14B8A6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                    txt,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenSize.height * 0.022,
                      ),
                    ),
                  );
  }
}