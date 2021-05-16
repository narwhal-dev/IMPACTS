import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Palette {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF372E2E),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xFF717171)),
      labelStyle: TextStyle(color: Colors.white),
    ),
    //brightness: Brightness.dark,
    focusColor: Color(0xFF261A0E),
    primaryColor: Colors.white,
    primaryColorDark: Color(0xFF161616),
    primaryColorLight: Color(0xFFFFFFFF),
    colorScheme: ColorScheme.dark(),
    canvasColor: Color(0xFFD5D1C9),
    accentColor: Color(0xFF161616),
    buttonColor: Color(0xFFD5D1C9),
    iconTheme: IconThemeData(color: Color(0xFFD5D1C9)),
    indicatorColor: Color(0xFFFF7B67),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF1F1F1),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Color(0xFF717171)),
      labelStyle: TextStyle(color: Colors.black),
    ),
    //brightness: Brightness.light,
    focusColor: Colors.white,
    primaryColor: Colors.black,
    primaryColorDark: Color(0xFFF1F1F1),
    primaryColorLight: Color(0xFF261A0E),
    colorScheme: ColorScheme.light(),
    canvasColor: Color(0xFFFFFFFF),
    accentColor: Color(0xFFFFFFFF),
    buttonColor: Color(0xFF261A0E),
    iconTheme: IconThemeData(color: Color(0xFF717171)),
    indicatorColor: Color(0xFFEB4D37),
  );
}
