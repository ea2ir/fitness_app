import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/pages/introduction.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Settings _settingOptions =
        Settings.fromMap(SettingOptions.getInstance().loadSettings());

    String _selectedTheme = _settingOptions.id_theme;
    String _selectedLanguage = _settingOptions.lang_name;
    String _languageType = _settingOptions.lang_type;

    ThemeData _customTheme =
        AppThemes.getInstance().indexOfTheme(_selectedTheme);
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_selectedLanguage);

    return MaterialApp(
      title: _customLanguage['appbar_selectLanguage'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_selectLanguage'], _customTheme),
          body: Center(
            child: Text(
              _customLanguage['appbar_selectLanguage'],
              style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
            ),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Introduction()));
  }
}
