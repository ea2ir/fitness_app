import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/pages/select_theme.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
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

    Future.delayed(const Duration(seconds: 3),(){navigatorPages(context);});

    return MaterialApp(
      title: _customLanguage['appbar_introduction'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_introduction'], _customTheme),
          body: Center(
            child: Text(
              _customLanguage['appbar_introduction'],
              style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
            ),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectTheme()));
  }
}
