import 'package:fitnessapp/db/db_helper.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/models/themes.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:fitnessapp/ui/screens/select_theme.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Introduction extends StatelessWidget {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());


  static const TextStyle upWidgetsTextStyleWhite = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle downWidgetsTextStyleWhite = TextStyle(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle downWidgetsTextStyleBlack = TextStyle(
    color: Colors.black87,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionTextStyleWhite = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
  );

  List<Container> pages(BuildContext context , String _idLang ) {
    return [
      Container(
        color: Color(0xef394f).withOpacity(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "کد تخفیف",
                    style: upWidgetsTextStyleWhite,
                  ),
                  InkWell(
                    splashColor: Color(0xef394f).withOpacity(1.0),
                    onTap: () {},
                    child: Text(
                      "خروج",
                      style: upWidgetsTextStyleWhite,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/introduction/photo_1.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("فروشگاه آنلاین", style: downWidgetsTextStyleWhite),
                    Text("دیجیکالا", style: downWidgetsTextStyleBlack),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "ارایه پایینترین قیمت ها\n"
                      "بهترین خدمات و\n"
                      "با طرح های تشویقی\n",
                      style: descriptionTextStyleWhite,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0x0FBED1).withOpacity(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "کد تخفیف",
                    style: upWidgetsTextStyleWhite,
                  ),
                  InkWell(
                    splashColor: Color(0x0FBED1).withOpacity(1.0),
                    onTap: () {},
                    child: Text(
                      "خروج",
                      style: upWidgetsTextStyleWhite,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/introduction/photo_2.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("فروشگاه آنلاین", style: downWidgetsTextStyleWhite),
                    Text("دیجیکالا", style: downWidgetsTextStyleBlack),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "طیف گسترده ای از  \n"
                      "معتبرترین برندها در  \n"
                      "گروه های مختلف  \n",
                      style: descriptionTextStyleWhite,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Color(0xFF894F).withOpacity(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "کد تخفیف",
                    style: upWidgetsTextStyleWhite,
                  ),
                  InkWell(
                    splashColor: Color(0xFF894F).withOpacity(1.0),
                    onTap: () {},
                    child: Text(
                      "خروج",
                      style: upWidgetsTextStyleWhite,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/introduction/photo_3.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("فروشگاه آنلاین", style: downWidgetsTextStyleWhite),
                    Text("دیجیکالا", style: downWidgetsTextStyleBlack),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "حداکثر اطمینان در انتخاب\n"
                      "با محتوای تخصصی\n"
                      "در کنار نقد و بررسی کالاها\n",
                      style: descriptionTextStyleWhite,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    Map<String, String> _customLanguage =
    CustomString.getInstance().selectLanguage(_settingOptions.lang_name);

    Scaffold(
      body: LiquidSwipe(
        pages: pages(context,_settingOptions.id_lang),
        enableLoop: true,
        fullTransitionValue: 400,
        enableSlideIcon: true,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
      ),
    );
  }
}

Future navigatorPages(BuildContext context, String _idLang) async {
  List<Themes> _getThemes;
  _getThemes = await DbHelper.getInstance().getThemesData(_idLang);
  await Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => SelectTheme(_getThemes)));
}
