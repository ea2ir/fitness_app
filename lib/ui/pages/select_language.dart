import 'dart:async';
import 'package:fitnessapp/models/languages.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/ui/pages/introduction.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/db/db_helper.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:fitnessapp/utils/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<Languages> _lang = [];
  StreamController _postsController = new StreamController();
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
      title: _customLanguage['appbar_selectLanguage'],
      theme: _customTheme,
      home: Directionality(
        textDirection:
            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
        child: Scaffold(
          appBar: CustomWidget.getInstance().mainAppBarWidget(
              _customLanguage['appbar_selectLanguage'], _customTheme),
          body: StreamBuilder(
            stream: _postsController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text(
                  "ERROR",
                  style: TextStyle(fontSize: 30.0, color: Colors.redAccent),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var item_name = snapshot.data[index].lang_name;
                    var item_type = snapshot.data[index].lang_type;

                    return ListTile(
                      title: RaisedButton(
                        color: _customTheme.primaryColor,
                        splashColor: _customTheme.splashColor,
                        onPressed: () async{
                          await changeLanguage(
                            item_name,
                            _selectedTheme,
                            item_type,
                          );
                          await closeDb();
                          await navigatorPages(context);
                        },
                        child: Text(
                          item_name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container(
                  color: Colors.redAccent,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    openDb();
    checkLanguages();
  }

  @override
  void dispose() {
    super.dispose();
    _postsController.close();
    closeDb();
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Introduction()));
  }

  openDb() async {
    await DbHelper.getInstance().openDB;
  }

  checkLanguages() async {
    _lang = await DbHelper.getInstance().getLanguageData();
    _postsController.add(_lang);
  }

  closeDb() async {
    await DbHelper.getInstance().closeDB;

  }

  changeLanguage(
    item_name,
    _mySelectedTheme,
    item_type,
  ) async {
    Settings _settings =
        new Settings("1", item_name, _mySelectedTheme, item_type);
    await DbHelper.getInstance().updateSettings(_settings);
    SettingOptions.getInstance().saveSettings({'id_theme':'$_mySelectedTheme','lang_name':'$item_name','lang_type':'$item_type',});
  }
}
