import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.yellow,
    brightness: Brightness.light,
  ),
  backgroundColor: Colors.white,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.red,
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.yellow,
    brightness: Brightness.dark,
  ),
  backgroundColor: Colors.black,
);

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
    _darkTheme = !_darkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
