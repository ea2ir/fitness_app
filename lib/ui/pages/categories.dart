import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
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
      title: _customLanguage['appbar_categories'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_categories'], _customTheme),
          body: Center(
            child: Text(
              _customLanguage['appbar_categories'],
              style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
            ),
          ),
        ),
      ),
    );
  }
}
