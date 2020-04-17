import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/categories_list.dart';
import 'package:fitnessapp/ui/screens/select_language.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  String _themeId;
  String _languageName;
  String _languageType;
  String _languageId;
  String _themeName;

  @override
  Widget build(BuildContext context) {
    databaseActions(context);

    ThemeData _customTheme = Theme.of(context);
    Map<String, String> _customLanguage =
    CustomString.getInstance().selectLanguage("");

    return Scaffold(
      body: Container(
        color: _customTheme.primaryColor,
        child: Center(
          child: Text(
            _customLanguage['appbar_splashscreen'],
            style: TextStyle(fontSize: 30.0, color: _customTheme.primaryColorDark),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {

    if (_themeId != "-1") {
      Navigator.pushReplacement(

          context, MaterialPageRoute(builder: (context) => CategoriesList()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SelectLanguage()));
    }
  }

  Future databaseActions(BuildContext context) async {
    await DbHelper.getInstance().db;
    await openDb();
    await checkSettings();
    await new Future.delayed(const Duration(seconds: 3), () async {
      SettingOptions.getInstance().saveSettings({
        'lang_name': '$_languageName',
        'id_theme': '$_themeId',
        'lang_type': '$_languageType',
        'id_lang': '$_languageId',
        'theme_name': '$_themeName',
      });
      navigatorPages(context);
      await closeDb();
    });
  }


  Future checkSettings() async {
    List<Settings> _settings;
    _settings = await DbHelper.getInstance().getSettingsData();
    _languageName = _settings[0].lang_name;
    _themeId = _settings[0].id_theme;
    _languageType = _settings[0].lang_type;
    _languageId = _settings[0].id_lang;
    _themeName = _settings[0].theme_name;
  }
}
openDb() async {
  await DbHelper.getInstance().openDB;
}

closeDb() async {
  await DbHelper.getInstance().closeDB;
}