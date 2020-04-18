import 'dart:io';

import 'package:fitnessapp/blocs/themes/theme_bloc.dart';
import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/enums/app_themes.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/categories_list.dart';
import 'package:fitnessapp/ui/screens/select_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  String _themeId;

  @override
  Widget build(BuildContext context) {
    databaseActions(context);

    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage("");

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            _customLanguage['appbar_splashscreen'],
            style: TextStyle(
                fontSize: 30.0, color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
    );
  }

  Future databaseActions(context) async {
    await DbHelper.getInstance().db;
    await openDb();
    await checkSettings(context);
    await navigatorPages(context);
  }

  Future navigatorPages(context) async {
    if (_themeId == "-1") {
      sleepTimer(5000);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectLanguage()));
    } else {
      sleepTimer(5000);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CategoriesList()));
    }
  }

  Future checkSettings(context) async {
    List<Settings> _settings;
    _settings = await DbHelper.getInstance().getSettingsData();

    SettingOptions.getInstance().saveSettings({
      'lang_name': '${_settings[0].lang_name}',
      'id_theme': '${_settings[0].id_theme}',
      'lang_type': '${_settings[0].lang_type}',
      'id_lang': '${_settings[0].id_lang}',
      'theme_name': '${_settings[0].theme_name}',
    });

    _themeId = _settings[0].id_theme;

    detectAndSetTheme(context, _themeId);
  }

  sleepTimer(intervalTime) {
    sleep(Duration(milliseconds: intervalTime));
  }
}

void detectAndSetTheme(_context, _themeId) {
  switch (_themeId) {
    case "1":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[0]));
      }
      break;
    case "2":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[1]));
      }
      break;
    case "3":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[2]));
      }
      break;
    case "4":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[3]));
      }
      break;
    case "5":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[4]));
      }
      break;
    case "6":
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[5]));
      }
      break;
    default:
      {
        BlocProvider.of<ThemeBloc>(_context)
            .add(ThemeChanged(theme: AppTheme.values[5]));
      }
  }
}

openDb() async {
  await DbHelper.getInstance().openDB;
}

closeDb() async {
  await DbHelper.getInstance().closeDB;
}
