import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.title, required this.subtitle, required this.trailing, required this.imagePath});
final String title;
final String subtitle;
final Widget trailing;
final String imagePath;
  @override
  Widget build(BuildContext context) {
    return ListTile(
            tileColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: Image.asset(imagePath),
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: ScreenSize.height * 0.023,
              ),
            ),
            subtitle: Text(
            subtitle,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: ScreenSize.height * 0.02,
              ),
            ),

            trailing: trailing,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Theme.of(context).dividerColor),
            ),
          );
  }
}