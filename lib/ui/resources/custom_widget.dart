import 'package:flutter/material.dart';

class CustomWidget {
  CustomWidget._();

  static final CustomWidget _ourInstance = new CustomWidget._();

  static CustomWidget getInstance() {
    return _ourInstance;
  }

  Widget mainAppBarWidget(String title, ThemeData customTheme) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[Icon(Icons.apps)],
      elevation: 8.0,
      backgroundColor: customTheme.primaryColor,
    );
  }

  Widget secondaryAppBarWidget(
      BuildContext context, String title, ThemeData customTheme) {
    return AppBar(
      title: Text(title),
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[Icon(Icons.apps)],
      elevation: 8.0,
      backgroundColor: customTheme.primaryColor,
    );
  }
}
