import 'dart:io';

import 'package:fitnessapp/blocs/themes/theme_bloc.dart';
import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/enums/app_themes.dart';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/languages.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/categories_list.dart';
import 'package:fitnessapp/ui/screens/select_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  String _themeId;
  String _idLang;

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _heightScreen = MediaQuery.of(context).size.height;

   databaseActions(context);


    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/logo/Logo.png"),
                  fit: BoxFit.cover),
            ),
            width: _widthScreen <
                       _heightScreen
                ? _widthScreen / 2
                : _heightScreen / 2,
            height:  _widthScreen <
                         _heightScreen
                     ? _widthScreen / 2
                     : _heightScreen / 2,
          ),
        ),
      ),
    );
  }

  Future databaseActions(context) async {
    await DbHelper.getInstance().db;
    await DbHelper.getInstance().openDB;
    await checkSettings(context);
    await navigatorPages(context);
  }

  Future navigatorPages(context) async {
    if (_themeId == "-1") {
      List<Languages> _getLanguages;
      _getLanguages = await DbHelper.getInstance().getLanguageData();
      await detectAndSetTheme(context, _themeId);

      await sleepTimer(5000);

      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SelectLanguage(_getLanguages)));
    } else {
      List<Categories> _getCategories;
      _getCategories = await DbHelper.getInstance().getCategoriesData(_idLang);
      await detectAndSetTheme(context, _themeId);

      await sleepTimer(5000);

      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CategoriesList(_getCategories)));
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
    _idLang = _settings[0].id_lang;

  }

  sleepTimer(intervalTime) {
    sleep(Duration(milliseconds: intervalTime));
  }
}

detectAndSetTheme(_context, _themeId) {
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
      }
  }
}
