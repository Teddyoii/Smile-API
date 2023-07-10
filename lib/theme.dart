import 'package:flutter/material.dart';

class SmileTheme {
  final Color _primaryColor = const Color(0xff56A5CC);
  final Color _background = const Color(0xffF8F9FB);
  final Color _onBackGround = Colors.black;

  final Color _error = const Color(0xff56A5CC);
  final Color _warning = const Color(0xFFFDCF41);
  final Color _success = const Color(0xFF5CFF7E);

  Color get primaryColor => _primaryColor;
  Color get backgroundColor => _background;
  Color get onBackGroundColor => _onBackGround;

  Color get errorColor => _error;
  Color get warningColor => _warning;
  Color get successColor => _success;

  ThemeData get theme => _getThemeData();

  ThemeData _getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffF8F9FB),
      brightness: Brightness.light,
      fontFamily: 'MontserratMedium',
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        primary: _primaryColor,
        onBackground: _onBackGround,
        background: _background,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            fixedSize: const Size(250, 50)),
      ),
    );
  }
}