import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {

  final int _selectedTheme = 0;
  final String _selectedLanguage = "";


  @override
  Widget build(BuildContext context) {
    ThemeData _customTheme = AppThemes.getInstance().indexOfTheme(_selectedTheme);
    Map<String , String> _customLanguage =  CustomString.getInstance().selectLanguage(_selectedLanguage);

    return MaterialApp(
      title: _customLanguage['appbar_introduction'],
      theme: _customTheme,
      home: Scaffold(
        appBar:
        CustomWidget.getInstance().mainAppBarWidget(_customLanguage['appbar_introduction'], _customTheme),
        body: Center(
          child: Text(
            'CATEGORIES :',
            style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
          ),
        ),
      ),
    );
  }

//  Future navigatorPages(BuildContext context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => Categories()));
//  }
}
