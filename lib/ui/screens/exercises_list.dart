import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/exercises.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/category_sigleton.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExcercisesList extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  String _catID = CategorySingleton.getInstance().catId;

  Future<List<Excercises>> listOfExcercises = excercisesList();

  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _heightScreen = MediaQuery.of(context).size.height;

    double customImageSize = 96.0;
    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_settingOptions.lang_name);


    return Directionality(
      textDirection: (_settingOptions.lang_type == "RTL"
          ? TextDirection.rtl
          : TextDirection.ltr),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_customLanguage['appbar_categories']),
        ),
        body: FutureBuilder<List<Excercises>>(
          future: listOfExcercises,
          builder: (context, snapshot) {
            List<Excercises> list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, _index) {
                Excercises item = list[_index];
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
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                          "assets/images/excercises/excercise-${item.id_exercise}-1.png",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  width: customImageSize,
                                  height: customImageSize,
                                ),
                              ),
                              Text(
                                item.exercise_name,
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
    );
  }
}

Future<List<Excercises>> excercisesList() async {
  await openDb();
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  String _catID = CategorySingleton.getInstance().catId;

  List<Excercises> _listOfExcercises = await DbHelper.getInstance()
      .getExcercisesData(_settingOptions.id_lang, _catID);

  await closeDb();
  return _listOfExcercises;
}

openDb() async {
  await DbHelper.getInstance().openDB;
}

closeDb() async {
  await DbHelper.getInstance().closeDB;
}
