import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_theme.dart';
import 'package:fitnessapp/resources/custom_widget.dart';
import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Categories>> listOfCategories = categoriesList();

  @override
  Widget build(BuildContext context) {
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
          body: FutureBuilder<List<Categories>>(
            future: listOfCategories,
            builder: (context, snapshot) {
              List<Categories> list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Categories item = list[index];
                  return new ListTile(
                    leading: Text(item.cat_name),
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

Future<List<Categories>> categoriesList() async {
  Settings _settingOptions =
  Settings.fromMap(SettingOptions.getInstance().loadSettings());
  return await DbHelper.getInstance().getCategoriesData(_settingOptions.id_lang);
}
