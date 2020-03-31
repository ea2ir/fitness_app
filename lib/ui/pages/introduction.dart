import 'package:fitnessapp/ui/pages/select_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Introduction extends StatelessWidget {
//  Map<String, String> _customLanguage;
//  String _languageType;
//  double _withScreen;

  @override
  Widget build(BuildContext context) {
//    MediaQueryData _queryData = MediaQuery.of(context);
//    _withScreen = _queryData.size.width;
//
//    Settings _settingOptions =
//        Settings.fromMap(SettingOptions.getInstance().loadSettings());
//
//    String _selectedTheme = _settingOptions.id_theme;
//    String _selectedLanguage = _settingOptions.lang_name;
//    _languageType = _settingOptions.lang_type;
//
//    ThemeData _customTheme =
//        AppThemes.getInstance().indexOfTheme(_selectedTheme);
//    _customLanguage =
//        CustomString.getInstance().selectLanguage(_selectedLanguage);

    return MaterialApp(
//      title: _customLanguage['appbar_introduction'],
//      theme: _customTheme,
      home:
//      Directionality(
//        textDirection:
//            (_languageType == "RTL" ? TextDirection.rtl : TextDirection.ltr),
//        child:
        Scaffold(
//            body: pages(context)[0]
        ),
//      ),
    );
  }

  Future navigatorPages(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectTheme()));
  }

//  List<Container> pages(BuildContext context) {
//    final TextStyle _lightTextStyleSmall = TextStyle(
//      color: Colors.white,
//      fontSize: 16.0,
//      fontWeight: FontWeight.bold,
//    );
//    final TextStyle _lightTextStyleLarge = TextStyle(
//      color: Colors.redAccent,
//      fontSize: 24.0,
//      fontWeight: FontWeight.bold,
//    );
//    final TextStyle _darkTextStyleSmall = TextStyle(
//      color: Colors.grey[800],
//      fontSize: 16.0,
//      fontWeight: FontWeight.bold,
//    );
//    final TextStyle _darkTextStyleLarge = TextStyle(
//      color: Colors.black87,
//      fontSize: 24.0,
//      fontWeight: FontWeight.bold,
//    );
//    return [
//      // * Container Page One :
//      Container(
//        color: Color(0xFEFF99).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _darkTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_1.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _darkTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_1'],
//                      style: _darkTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      // * Container Page Two :
//      Container(
//        color: Color(0x330000).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _lightTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_2.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _lightTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_2'],
//                      style: _lightTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      // * Container Page Three :
//      Container(
//        color: Color(0x653366).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _lightTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_3.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _darkTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_3'],
//                      style: _lightTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      // * Container Page Four :
//      Container(
//        color: Color(0x240024).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _lightTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_4.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _lightTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_4'],
//                      style: _lightTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      // * Container Page Five :
//      Container(
//        color: Color(0x63CDFF).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _darkTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_5.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _darkTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_5'],
//                      style: _darkTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      // * Container Page Six :
//      Container(
//        color: Color(0x000034).withOpacity(1.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding:
//                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                    splashColor: Color(0xef394f).withOpacity(1.0),
//                    onTap: () {
//                      navigatorPages(context);
//                    },
//                    child: Text(
//                      _customLanguage['introduction_exit'],
//                      style: _lightTextStyleSmall,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Image.asset(
//              "assets/images/introduction/photo_6.jpg",
//              width: _withScreen,
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              child: Directionality(
//                textDirection: TextDirection.rtl,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(_customLanguage['app_name'],
//                        style: _lightTextStyleLarge),
//                    SizedBox(
//                      height: 16.0,
//                    ),
//                    Text(
//                      _customLanguage['introduction_text_6'],
//                      style: _lightTextStyleSmall,
//                      textAlign: (_languageType == "RTL"
//                          ? TextAlign.right
//                          : TextAlign.left),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    ];
//  }
}
