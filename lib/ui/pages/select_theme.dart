import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/pages/categories.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/db/db_helper.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/material.dart';

class SelectTheme extends StatefulWidget {
  @override
  _SelectThemeState createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  Settings _settingOptions;

  @override
  Widget build(BuildContext context) {
    _settingOptions =
        Settings.fromMap(SettingOptions.getInstance().loadSettings());

    String _selectedTheme = _settingOptions.id_theme;
    String _selectedLanguage = _settingOptions.lang_name;
    String _languageType = _settingOptions.lang_type;

    ThemeData _customTheme =
        AppThemes.getInstance().indexOfTheme(_selectedTheme);
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_selectedLanguage);


    return MaterialApp(
      title: _customLanguage['appbar_selectTheme'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_selectTheme'], _customTheme),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  color: AppThemes.getInstance().indexOfTheme("0").primaryColor,
                  splashColor:
                      AppThemes.getInstance().indexOfTheme("0").splashColor,
                  onPressed: () async{
                    await changeTheme(
                      _selectedLanguage,
                      "0",
                      _languageType,
                    );
                    await closeDb();
                    await navigatorPages(context);
                  },
                  child: Text(
                    "${_customLanguage['theme_default']}",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                RaisedButton(
                  color: AppThemes.getInstance().indexOfTheme("1").primaryColor,
                  splashColor:
                      AppThemes.getInstance().indexOfTheme("1").splashColor,
                  onPressed: () async{
                    await changeTheme(
                      _selectedLanguage,
                      "1",
                      _languageType,
                    );
                    await closeDb();
                    await navigatorPages(context);
                  },
                  child: Text(
                    "${_customLanguage['theme_blue']}",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                RaisedButton(
                  color: AppThemes.getInstance().indexOfTheme("2").primaryColor,
                  splashColor:
                      AppThemes.getInstance().indexOfTheme("2").splashColor,
                  onPressed: () async{
                    await changeTheme(
                      _selectedLanguage,
                      "2",
                      _languageType,
                    );
                    await closeDb();
                    await navigatorPages(context);
                  },
                  child: Text(
                    "${_customLanguage['theme_red']}",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                RaisedButton(
                  color: AppThemes.getInstance().indexOfTheme("3").primaryColor,
                  splashColor:
                      AppThemes.getInstance().indexOfTheme("3").splashColor,
                  onPressed: () async{
                   await changeTheme(
                      _selectedLanguage,
                      "3",
                      _languageType,
                    );
                   await closeDb();

                   await navigatorPages(context);
                  },
                  child: Text(
                    "${_customLanguage['theme_green']}",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    openDb();
  }

  @override
  void dispose() {
    super.dispose();
    closeDb();
  }

  openDb() async {
    await DbHelper.getInstance().openDB;
  }

  closeDb() async {
    await DbHelper.getInstance().closeDB;
  }

  changeTheme(
    _langName,
    _mySelectedTheme,
    _langType,
  ) async {
    Settings _settings =
    new Settings("1", _langName, _mySelectedTheme, _langType);
    await DbHelper.getInstance().updateSettings(_settings);
    SettingOptions.getInstance().saveSettings({'id_theme':'$_mySelectedTheme','lang_name':'$_langName','lang_type':'$_langType',});
    print("SELECTED:${_mySelectedTheme} / DEFAULT:${_settingOptions.id_theme}");
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Categories()));
  }
}
