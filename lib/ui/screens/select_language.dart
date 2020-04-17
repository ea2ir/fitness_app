import 'dart:async';

import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/languages.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/models/themes.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/select_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Languages>> listOfLanguages = languagesList();

  @override
  Widget build(BuildContext context) {
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_settingOptions.lang_name);

    return Directionality(
      textDirection: (_settingOptions.lang_type == "RTL"
          ? TextDirection.rtl
          : TextDirection.ltr),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_customLanguage['appbar_selectLanguage']),
        ),
        body: FutureBuilder<List<Languages>>(
          future: listOfLanguages,
          builder: (context, snapshot) {
            List<Languages> list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Languages item = list[index];
                return new ListTile(
                  leading: RaisedButton(
                    child: Text(item.lang_name),
                    color: Theme.of(context).primaryColor,
                    splashColor: Theme.of(context).splashColor,
                    onPressed: () async {
                      await changeLanguage(
                        item.lang_name,
                        _settingOptions.id_theme,
                        item.lang_type,
                        item.id_lang,
                        _settingOptions.theme_name,
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
  Future<List<Themes>> _listOfThemes = themesList();
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SelectTheme(
                listOfThemes: _listOfThemes,
              )));
}

Future<List<Themes>> themesList() async {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  List<Themes> _listOfThemes =
      await DbHelper.getInstance().getThemesData(_settingOptions.id_lang);
  await closeDb();
  return _listOfThemes;
}
