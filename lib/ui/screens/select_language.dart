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
  final List<Languages> listOfLanguages;

  SelectLanguage(this.listOfLanguages);

  Settings _settingOptions =
  Settings.fromMap(SettingOptions.getInstance().loadSettings());

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
        body: ListView.builder(
          itemCount: listOfLanguages.length,
          itemBuilder: (context, index) {
            Languages item = listOfLanguages[index];
            return new ListTile(
              leading: RaisedButton(
                child: Text(item.lang_name),
                color: Theme
                    .of(context)
                    .primaryColor,
                splashColor: Theme
                    .of(context)
                    .splashColor,
                onPressed: () async {
                  await changeLanguage(
                    item.lang_name,
                    _settingOptions.id_theme,
                    item.lang_type,
                    item.id_lang,
                    _settingOptions.theme_name,
                  );
                  await navigatorPages(context, item.id_lang);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

changeLanguage(_languageName,
               _themeId,
               _languageType,
               _languageId,
               _themeName,) async {
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

Future navigatorPages(BuildContext context, String _idLang) async {
  List<Themes> _getThemes;
  _getThemes= await DbHelper.getInstance().getThemesData(_idLang);
  await Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => SelectTheme(_getThemes)));
}
