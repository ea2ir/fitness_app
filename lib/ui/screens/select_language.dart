import 'dart:async';
import 'package:fitnessapp/models/languages.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/screens/select_theme.dart';
import 'package:fitnessapp/resources/custom_theme.dart';
import 'package:fitnessapp/resources/custom_widget.dart';
import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  Settings _settingOptions =
  Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Languages>> listOfCategories = languagesList();

  @override
  Widget build(BuildContext context) {
    String _themeId = _settingOptions.id_theme;
    String _languageName = _settingOptions.lang_name;
    String _languageType = _settingOptions.lang_type;
    String _languageId = _settingOptions.id_lang;
    String _themeName = _settingOptions.theme_name;

    ThemeData _customTheme = AppThemes.getInstance().indexOfTheme(_themeId);
    Map<String, String> _customLanguage =
    CustomString.getInstance().selectLanguage(_languageName);

    return MaterialApp(
      title: _customLanguage['appbar_selectLanguage'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
        (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_selectLanguage'], _customTheme),
          body: FutureBuilder<List<Languages>>(
            future: listOfCategories,
            builder: (context, snapshot) {
              List<Languages> list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Languages item = list[index];
                  return new ListTile(
                    leading: RaisedButton(
                      child: Text(item.lang_name),
                      color: _customTheme.primaryColor,
                      splashColor: _customTheme.splashColor,
                      onPressed: () async {
                        await changeLanguage(
                          item.lang_name,
                          _themeId,
                          item.lang_type,
                          item.id_lang,
                          _themeName,
                        );
                        await navigatorPages(context);
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

changeLanguage(
    _languageName,
    _themeId,
    _languageType,
    _languageId,
    _themeName,
    ) async {
  Settings _settings = new Settings(
      "1", _languageName, _themeId, _languageType, _languageId, _themeName);
  await DbHelper.getInstance().updateSettings(_settings);
  SettingOptions.getInstance().saveSettings({
    'lang_name': '$_languageName',
    'id_theme': '$_themeId',
    'lang_type': '$_languageType',
    'id_lang': '$_languageId',
    'theme_name': '$_themeName',
  });
}

openDb() async {
  await DbHelper.getInstance().openDB;
}

closeDb() async {
  await DbHelper.getInstance().closeDB;
}

Future<List<Languages>> languagesList() async {
  await openDb();
  return await DbHelper.getInstance().getLanguageData();
}

Future navigatorPages(BuildContext context) async {
  await closeDb();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SelectTheme()));
}