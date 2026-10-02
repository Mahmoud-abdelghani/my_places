import 'package:flutter/material.dart';
import 'package:my_places/core/screen_size.dart';
import 'package:my_places/l10n/app_localizations.dart';
import 'package:my_places/main.dart';
import 'package:my_places/widgets/custom_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.placesCount,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });
  final int placesCount;
  final Function(bool)? onThemeChanged;
  final Function(String?)? onLanguageChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languages = ['Arabic', 'English'];

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),

        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        title: Text(
          AppLocalizations.of(context).settings,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: ScreenSize.height * 0.029,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTile(
              title: AppLocalizations.of(context).theme,
              subtitle: themeMode == ThemeMode.dark ? 'Dark' : 'Light',
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: widget.onThemeChanged,
                activeColor: Theme.of(context).primaryColor,
              ),
              imagePath: 'assets/Container_margin.png',
            ),
            SizedBox(height: ScreenSize.height * 0.02),
            CustomTile(
              title: 'Language',
              subtitle: locale.languageCode == 'en' ? 'English' : 'Arabic',
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                  hint: Text(
                    locale.languageCode == 'en' ? 'English' : 'Arabic',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  items: languages
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: widget.onLanguageChanged,
                ),
              ),
              imagePath: 'assets/Container10.png',
            ),
            SizedBox(height: ScreenSize.height * 0.02),

            CustomTile(
              title: 'Delete',
              subtitle: ' ${widget.placesCount} places saved',
              trailing: TextButton(
                onPressed: () {
                  //implement
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              imagePath: 'assets/Container_margin.png',
            ),
          ],
        ),
      ),
    );
  }
}
