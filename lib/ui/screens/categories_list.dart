import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/exercises.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/category_sigleton.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/exercises_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<Categories> listOfCategories;

  CategoriesList(this.listOfCategories);

  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());

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
                  child: Text(
                    _customLanguage['text_no'],
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(_context).pop(true),
                  child: Text(
                    _customLanguage['text_yes'],
                    style: TextStyle(color: Colors.green),
                  ),
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
          body: ListView.builder(
            itemCount: listOfCategories.length,
            itemBuilder: (context, index) {
              Categories item = listOfCategories[index];
              return Container(
                height: customImageSize,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          CategorySingleton.getInstance().saveCatId(
                            listOfCategories[index].id_cat,
                          );
                          navigatorPages(context,listOfCategories[index].id_lang ,listOfCategories[index].id_cat );
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
                                        "assets/images/cat_list/cat-$index.png",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                width: customImageSize,
                                height: customImageSize,
                              ),
                            ),
                            Text(
                              item.cat_name,
                              style: TextStyle(fontSize: customImageSize / 6),
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
          ),
        ),
      ),
    );
  }
}

Future navigatorPages(context,_idLang, _catID) async{
  List<Exercises> _getExerciseList;
  _getExerciseList= await DbHelper.getInstance()
      .getExercisesData(_idLang, _catID);

  await Navigator.push(
      context, MaterialPageRoute(builder: (context) => ExercisesList(_getExerciseList)));
}
