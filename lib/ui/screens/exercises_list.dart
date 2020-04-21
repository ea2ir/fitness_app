import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/exercise_item.dart';
import 'package:fitnessapp/models/exercises.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/category_sigleton.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/exercise_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExercisesList extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());

  Future<List<Exercises>> listOfExercises = exercisesList();

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
          title: Text(_customLanguage['appbar_exercise_list']),
        ),
        body: FutureBuilder<List<Exercises>>(
          future: listOfExercises,
          builder: (context, snapshot) {
            List<Exercises> list = snapshot.data ?? [];
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, _index) {
                Exercises item = list[_index];
                return Container(
                  height: customImageSize,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                         await navigatorPages(context,await exerciseItem(item.id_lang,item.id_exercise) );
                          },
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
                                          "assets/images/exercises/exercise-${item.id_exercise}-1.png",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  width: customImageSize,
                                  height: customImageSize,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  item.exercise_name,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style:
                                  TextStyle(fontSize: customImageSize / 6),
                                ),
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

Future<List<Exercises>> exercisesList() async {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());
  String _catID = CategorySingleton.getInstance().loadCatId();

  List<Exercises> _listOfExercises = await DbHelper.getInstance()
      .getExercisesData(_settingOptions.id_lang, _catID);
  return _listOfExercises;
}
Future<List<ExerciseItem>> exerciseItem(String _IdLang,String _SelectedExerciseId) async {
  List<ExerciseItem> _listOfExercises = await DbHelper.getInstance()
      .getExerciseItem(_IdLang, _SelectedExerciseId);
  return _listOfExercises;
}
Future<void> navigatorPages(context ,List<ExerciseItem> _selectedExercise) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ExercisePage(selectedExercise: _selectedExercise)));
}