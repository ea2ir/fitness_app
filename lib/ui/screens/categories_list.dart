import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Categories>> listOfCategories = categoriesList();

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
          title: Text(_customLanguage['appbar_categories']),),
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
    );
  }
}

openDb() async {
  await DbHelper.getInstance().openDB;
}

closeDb() async {
  await DbHelper.getInstance().closeDB;
}

Future<List<Categories>> categoriesList() async {
  await openDb();
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  List<Categories> _listOfCategories =
      await DbHelper.getInstance().getCategoriesData(_settingOptions.id_lang);
  await closeDb();
  return _listOfCategories;
}
