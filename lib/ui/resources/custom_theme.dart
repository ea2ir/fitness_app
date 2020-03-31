import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final AppThemes _ourInstance = new AppThemes._();

  static AppThemes getInstance() {
    return _ourInstance;
  }

  ThemeData indexOfTheme(String _index) {
    var _selectedTheme;
    switch (_index) {
      case ("1"):
        {
          _selectedTheme = new ThemeData(
            /// A color that contrasts with the [primaryColor], e.g. used as the
            /// remaining part of a progress bar.
            backgroundColor: Colors.green[700],

            /// The foreground color for widgets (knobs, text, overscroll edge effect, etc).
            accentColor: Colors.deepPurple[900],

            /// The background color for major parts of the app (toolbars, tab bars, etc).
            primaryColor: Colors.green[700],

            /// A lighter version of the [primaryColor].
            primaryColorLight: Colors.green[400],

            /// A darker version of the [primaryColor].
            primaryColorDark: Colors.green[900],

            /// background color for a typical material app or a page within the app.
            scaffoldBackgroundColor: Colors.white,

            /// The background color of [Dialog] elements.
            dialogBackgroundColor: Colors.white,

            /// The color of cursors in Material-style text fields, such as [TextField].
            cursorColor: Colors.deepPurple[900],

            /// The color of [Divider]s and [PopupMenuDivider]s, also used
            /// between [ListTile]s, between rows in [DataTable]s, and so forth.
            dividerColor: Colors.grey[700],

            /// The color used for widgets that are inoperative, regardless of
            /// their state. For example, a disabled checkbox (which may be
            /// checked or unchecked).
            disabledColor: Colors.grey,

            /// The color of ink splashes. See [InkWell].
            splashColor: Colors.blueGrey[700],
          );
        }
        break;
      case ("2"):
        {

          _selectedTheme = new ThemeData(
            backgroundColor: Colors.blue,
            accentColor: Colors.pinkAccent,
            primaryColor: Colors.blue,
            primaryColorLight: Colors.blue[400],
            primaryColorDark: Colors.blue[800],
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            cursorColor: Colors.pinkAccent,
            dividerColor: Colors.grey[700],
            disabledColor: Colors.grey,
            splashColor: Colors.blueGrey[700],
          );
        }
        break;
      case ("3"):
        {
          _selectedTheme = new ThemeData(
            backgroundColor: Colors.red,
            accentColor: Colors.brown[600],
            primaryColor: Colors.red,
            primaryColorLight: Colors.red[400],
            primaryColorDark: Colors.red[900],
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            cursorColor: Colors.brown[600],
            dividerColor: Colors.grey,
            disabledColor: Colors.grey,
            splashColor: Colors.amber,
          );
        }
        break;

      case ("4"):
        {
          _selectedTheme = new ThemeData(
            backgroundColor: Colors.yellow[700],
            accentColor: Colors.lightBlue[900],
            primaryColor: Colors.yellow[700],
            primaryColorLight: Colors.yellow[400],
            primaryColorDark: Colors.yellow[900],
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            cursorColor: Colors.lightBlue[900],
            dividerColor: Colors.grey,
            disabledColor: Colors.grey,
            splashColor: Colors.orange[100],
          );
        }
        break;

      default:
        {
          _selectedTheme = new ThemeData(
            backgroundColor: Colors.green[700],
            accentColor: Colors.deepPurple[900],
            primaryColor: Colors.green[700],
            primaryColorLight: Colors.green[400],
            primaryColorDark: Colors.green[900],
            scaffoldBackgroundColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            cursorColor: Colors.deepPurple[900],
            dividerColor: Colors.grey[700],
            disabledColor: Colors.grey,
            splashColor: Colors.blueGrey[700],
          );
        }
    }

    return _selectedTheme;
  }
}
