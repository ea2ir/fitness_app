import 'package:flutter/material.dart';

enum AppTheme { Default, Blue, Red, DefaultDark, BlueDark, RedDark }

final appThemeData = {
  AppTheme.Default:
  ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.yellowAccent[700],
    primaryColor: Colors.green[700],
    primaryColorLight: Colors.green[400],
    primaryColorDark: Colors.green[900],
    cursorColor: Colors.yellowAccent[700],
    dividerColor: Colors.grey[700],
    disabledColor: Colors.grey,
    splashColor: Colors.pink[700],
  ),
  AppTheme.Blue:
  ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.cyanAccent,
    primaryColor: Colors.blue,
    primaryColorLight: Colors.blue[400],
    primaryColorDark: Colors.blue[800],
    cursorColor: Colors.cyanAccent,
    dividerColor: Colors.grey[700],
    disabledColor: Colors.grey,
    splashColor: Colors.deepPurple,
  ),
  AppTheme.Red:
  ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.amber,
    primaryColor: Colors.red,
    primaryColorLight: Colors.red[400],
    primaryColorDark: Colors.red[900],
    cursorColor: Colors.amber,
    dividerColor: Colors.grey[700],
    disabledColor: Colors.grey,
    splashColor: Colors.pinkAccent,
  ),
  AppTheme.DefaultDark:
  ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.yellowAccent[700],
    primaryColor: Colors.green[700],
    primaryColorLight: Colors.green[400],
    primaryColorDark: Colors.green[900],
    cursorColor: Colors.yellowAccent[700],
    dividerColor: Colors.white,
    disabledColor: Colors.grey,
    splashColor: Colors.pink[700],
  ),
  AppTheme.BlueDark:
  ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.cyanAccent,
    primaryColor: Colors.blue,
    primaryColorLight: Colors.blue[400],
    primaryColorDark: Colors.blue[800],
    cursorColor: Colors.cyanAccent,
    dividerColor: Colors.white,
    disabledColor: Colors.grey,
    splashColor: Colors.deepPurple,
  ),
  AppTheme.RedDark:
  ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.red,
    primaryColorLight: Colors.red[400],
    primaryColorDark: Colors.red[900],
    cursorColor: Colors.amber,
    dividerColor: Colors.white,
    disabledColor: Colors.grey,
    splashColor: Colors.pinkAccent,
  ),
};
