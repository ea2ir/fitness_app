import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/models/themes.dart';
import 'package:fitnessapp/ui/pages/categories_list.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/db/db_helper.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/material.dart';

class SelectTheme extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Themes>> _listOfThemes = themesList();

  @override
  Widget build(BuildContext context) {
    String _languageName = _settingOptions.lang_name;
    String _themeId = _settingOptions.id_theme;
    String _languageType = _settingOptions.lang_type;
    String _languageId = _settingOptions.id_lang;
    String _themeName = _settingOptions.theme_name;


    ThemeData _customTheme = AppThemes.getInstance().indexOfTheme(_themeId);
    Map<String, String> _customLanguage =
    CustomString.getInstance().selectLanguage(_languageName);


    return MaterialApp(
      title: _customLanguage['appbar_selectTheme'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
        (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_selectTheme'], _customTheme),
          body: FutureBuilder<List<Themes>>(
            future: _listOfThemes,
            builder: (context, snapshot) {
              List<Themes> _list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  Themes _item = _list[index];
                  return new ListTile(
                    title: new RaisedButton(
                            color: AppThemes.getInstance()
                                .indexOfTheme("${_item.id_theme}")
                                .primaryColor,
                            splashColor: AppThemes.getInstance()
                                .indexOfTheme("${_item.id_theme}")
                                .splashColor,
                      onPressed: () async {
                        await changeTheme(
                          _languageName,
                          _item.id_theme,
                          _languageType,
                          _languageId,
                          _item.theme_name,
                        );
                        await navigatorPages(context);
                      },
                            child: Text(
                              "${_item.theme_name}",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
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

  openDb() async {
    await DbHelper.getInstance().openDB;
  }

  closeDb() async {
    await DbHelper.getInstance().closeDB;
  }

changeTheme(
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


  Future navigatorPages(BuildContext context) async {
    await closeDb();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CategoriesList()));
  }


Future<List<Themes>> themesList() async {
  Settings _settingOptions =
  Settings.fromMap(SettingOptions.getInstance().loadSettings());
  openDb();
  return await DbHelper.getInstance().getThemesData(_settingOptions.id_lang);
}
