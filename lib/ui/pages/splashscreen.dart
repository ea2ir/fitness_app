import 'package:fitnessapp/ui/pages/select_language.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final int _selectedTheme = 0;
  final String _selectedLanguage = "";


  @override
  Widget build(BuildContext context) {
    ThemeData _customTheme = AppThemes.getInstance().indexOfTheme(_selectedTheme);
    Map<String , String> _customLanguage =  CustomString.getInstance().selectLanguage(_selectedLanguage);

    delayTime(context);
    return MaterialApp(
      title: _customLanguage['appbar_introduction'],
      theme: _customTheme,
      home: Scaffold(
        appBar:
        CustomWidget.getInstance().mainAppBarWidget(_customLanguage['appbar_introduction'], _customTheme),
        body: Center(
          child: Text(
            'Wellcome !',
            style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => SelectLanguage()));
  }

  Future delayTime(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 3));
    navigatorPages(context);
  }
}