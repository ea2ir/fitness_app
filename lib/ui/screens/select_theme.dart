import 'package:fitnessapp/blocs/themes/theme_bloc.dart';
import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/enums/app_themes.dart';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/models/themes.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/categories_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTheme extends StatelessWidget {
  final List<Themes> listOfThemes;

  SelectTheme(this.listOfThemes);

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
          title: Text(_customLanguage['appbar_selectTheme']),
          actions: <Widget>[
            Center(child: Text(_customLanguage['text_confirm'])),
            IconButton(
              onPressed: () async {
                await changeTheme(
                  _settingOptions.lang_name,
                  _settingOptions.id_theme,
                  _settingOptions.lang_type,
                  _settingOptions.id_lang,
                  _settingOptions.theme_name,
                );
                await navigatorPages(context, _settingOptions.id_lang);
              },
              icon: Icon(Icons.check_circle),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listOfThemes.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            final itemAppTheme = AppTheme.values[index];
            return Card(
              color: appThemeData[itemAppTheme].primaryColor,
              child: ListTile(
                  title: Text(
                    '${listOfThemes[index].theme_name}',
                    style: appThemeData[itemAppTheme].textTheme.body1,
                  ),
                  onTap: () {
                    SettingOptions.getInstance().saveSettings({
                      'lang_name': '${_settingOptions.lang_name}',
                      'id_theme': '${listOfThemes[index].id_theme}',
                      'lang_type': '${_settingOptions.lang_type}',
                      'id_lang': '${_settingOptions.id_lang}',
                      'theme_name': '${listOfThemes[index].theme_name}',
                    });
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeChanged(theme: itemAppTheme));
                  }),
            );
          },
        ),
      ),
    );
  }
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
}

Future navigatorPages(BuildContext context, String _idLang) async {
  List<Categories> _getCategories =
      await DbHelper.getInstance().getCategoriesData(_idLang);
  await Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => CategoriesList(_getCategories)));
}
