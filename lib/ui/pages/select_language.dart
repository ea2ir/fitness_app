import 'package:fitnessapp/ui/pages/introduction.dart';
import 'package:fitnessapp/ui/resources/custom_theme.dart';
import 'package:fitnessapp/ui/resources/custom_widget.dart';
import 'package:fitnessapp/utils/resources/custom_string.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  final int _selectedTheme = 0;
  final String _title = CustomString.getInstance().blocBtnTitle;

  @override
  Widget build(BuildContext context) {
    ThemeData _customTheme = AppThemes.getInstance().indexOfTheme(_selectedTheme);
    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar:
        CustomWidget.getInstance().mainAppBarWidget(_title, _customTheme),
        body: Center(
          child: Text(
            'SELECT LANGUAGE :',
            style: TextStyle(fontSize: 30.0, color: _customTheme.accentColor),
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Introduction()));
  }
}
