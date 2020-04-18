import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  Future<List<Categories>> listOfCategories = categoriesList();

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _heightScreen = MediaQuery.of(context).size.height;

    double customImageSize = 96.0;
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_settingOptions.lang_name);

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (_context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: Container(
                child: Text(_customLanguage['text_are_you_sure'],
                    textDirection: _settingOptions.lang_type == "RTL"
                    ? TextDirection.rtl
                    : TextDirection.ltr),
              ),
              content: Text(_customLanguage['text_you_want_exit'],
                  textDirection: _settingOptions.lang_type == "RTL"
                      ? TextDirection.rtl
                      : TextDirection.ltr),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(_context).pop(false),
                  child: Text(_customLanguage['text_no']),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(_context).pop(true),
                  child: Text(_customLanguage['text_yes']),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Directionality(
        textDirection: (_settingOptions.lang_type == "RTL"
            ? TextDirection.rtl
            : TextDirection.ltr),
        child: Scaffold(
          appBar: AppBar(
            title: Text(_customLanguage['appbar_categories']),
          ),
          body: FutureBuilder<List<Categories>>(
            future: listOfCategories,
            builder: (context, snapshot) {
              List<Categories> list = snapshot.data ?? [];
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Categories item = list[index];
                  return Container(
                    height: customImageSize,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 4.0, start: 8.0, end: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: ExactAssetImage(
                                            "assets/images/introduction/photo_1.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    width: customImageSize,
                                    height: customImageSize,
                                  ),
                                ),
                                Text(
                                  item.cat_name,
                                  style:
                                      TextStyle(fontSize: customImageSize / 6),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 0.0,
                              start: 8.0 * 2 + (customImageSize),
                              end: 0.0),
                          child: Divider(
                            height: 1.0,
                            color: Theme.of(context).dividerColor,
                            thickness: 1.0,
                          ),
                        ),
                      ],
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

Future<List<Categories>> categoriesList() async {
  await openDb();
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  List<Categories> _listOfCategories =
      await DbHelper.getInstance().getCategoriesData(_settingOptions.id_lang);
  await closeDb();
  return _listOfCategories;
}
