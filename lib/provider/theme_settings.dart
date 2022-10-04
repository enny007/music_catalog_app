import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemes {
  //So any modification to the ui color will be donw in this class
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.yellow,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
  );
}

class ThemeSettings with ChangeNotifier {
  bool _darkTheme = false;
  SharedPreferences? _preferences;
  bool get darkTheme => _darkTheme;

  _initializePrefs() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  ThemeSettings() {
    _loadFromPrefs();
  }

  _loadFromPrefs() async {
    await _initializePrefs();
    _darkTheme = _preferences?.getBool('darkTheme') ?? false;
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializePrefs();
    _preferences?.setBool('darkTheme', _darkTheme);
  }

  void toggleTheme() {
    _darkTheme = !darkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
