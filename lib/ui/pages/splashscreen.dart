import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/pages/categories.dart';
import 'package:fitnessapp/ui/pages/select_language.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/db/db_helper.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  String _selectedTheme;
  String _selectedLanguage;
  String _languageType;

  @override
  Widget build(BuildContext context) {
    databaseActions(context);

    ThemeData _customTheme =
        AppThemes.getInstance().indexOfTheme(_selectedTheme);
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_selectedLanguage);

    return MaterialApp(
      title: _customLanguage['appbar_introduction'],
      theme: _customTheme,
      home: Directionality( textDirection:(_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_introduction'], _customTheme),
          body: Center(
            child: Text(
              'Wellcome !',
              style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
            ),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {

    SettingOptions.getInstance().saveSettings({'id_theme':'$_selectedTheme','lang_name':'$_selectedLanguage','lang_type':'$_languageType'});

    if (_selectedTheme != "-1") {
     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Categories()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectLanguage()));
    }
  }

  Future delayTime(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 3));
    await navigatorPages(context);
  }

  Future databaseActions(BuildContext context) async {
    await DbHelper.getInstance().db;
    await DbHelper.getInstance().openDB;
    await checkSettings();
    await DbHelper.getInstance().closeDB;
    delayTime(context);

  }

  Future checkSettings() async {
    List<Settings> _settings;
    _settings = await DbHelper.getInstance().getSettingsData();
    _selectedLanguage = _settings[0].lang_name;
    _selectedTheme = _settings[0].id_theme;
    _languageType = _settings[0].lang_type;
  }
}
