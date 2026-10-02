import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(
      0xFFF8FAFC,
    ), // Slate 50 (خلفية فاتحة ونقية)
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF0F172A)),
      titleTextStyle: TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    primaryColor: const Color(
      0xFF0D9488,
    ), // Teal 600 (أغمق قليلاً من الـ Dark Theme للتباين العالي على الأبيض)
    primaryColorDark: const Color(
      0xFF0F172A,
    ), // Slate 900 (لون النصوص والعناصر الأساسية)
    primaryColorLight: const Color(
      0xFFCCFBF1,
    ), // Teal 100 (لون خفيف للخلفيات المحددة أو الـ Badges)
    hintColor: const Color(
      0xFF64748B,
    ), // Slate 500 (لون النصوص الفرعية والـ Placeholders)
    dividerColor: const Color(0xFFE2E8F0), // Slate 200 (حدود وخطوط فاصلة ناعمة)
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    cardColor: const Color(0xFF1E293B),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E293B),
      elevation: 0,
    ),
    primaryColor: const Color(0xFF14B8A6), // Teal 500
    primaryColorDark: Colors.white,
    primaryColorLight: const Color(0x4D1E293B),
    hintColor: const Color(0xFF94A3B8),
    dividerColor: const Color(0xFF334155),
  );
}
