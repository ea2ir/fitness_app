import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnessapp/models/exercise_item.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/resources/custom_string.dart';
import 'package:fitnessapp/resources/setting_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ExercisePage extends StatefulWidget {
  List<ExerciseItem> selectedExercise;

  ExercisePage({Key key, @required this.selectedExercise}) : super(key: key);

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  Settings _settingOptions =
      Settings.fromMap(SettingOptions.getInstance().loadSettings());

  bool isPressInformationIcon = false;

  @override
  Widget build(BuildContext context) {
    final ExerciseItem _selectedExercise = widget.selectedExercise[0];

    Map<String, String> _customLanguage =
        CustomString.getInstance().selectLanguage(_settingOptions.lang_name);

    PreferredSizeWidget _appbar = AppBar(
      title: Text(_customLanguage['appbar_exercise']),
    );
    double _bodyHeight = (MediaQuery.of(context).size.height) -
        (_appbar.preferredSize.height) -
        (MediaQuery.of(context).padding.top);

    double customImageSize = MediaQuery.of(context).size.width / 6;

    return Directionality(
      textDirection: (_settingOptions.lang_type == "RTL"
          ? TextDirection.rtl
          : TextDirection.ltr),
      child: Scaffold(
        appBar: _appbar,
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: _bodyHeight * 0.95,
              child: isPressInformationIcon == true
                  ?
                  // * Description Of Selected Exercise with Thimbles Photo's.
                  Container(
                      child: Column(
                        children: <Widget>[
                          Divider(color: Theme.of(context).primaryColor),
                          Container(
                            height: customImageSize,
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsetsDirectional.only(
                                    start: customImageSize / 12,
                                    end: customImageSize / 12),
                                scrollDirection: Axis.horizontal,
                                itemCount: int.parse(_selectedExercise.qty_photos),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: customImageSize / 12,
                                        end: customImageSize / 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                "assets/images/exercises/exercise-${_selectedExercise.id_exercise}-${index + 1}.png"),
                                            fit: BoxFit.cover),
                                      ),
                                      width: customImageSize,
                                      height: customImageSize,
                                    ),
                                  );
                                }),
                          ),
                          // * Description Of Selected Exercise .
                          Divider(color: Theme.of(context).primaryColor),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  _selectedExercise.exercise_detail,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .title
                                          .fontSize),
                                  textAlign: TextAlign.start,
                                  maxLines: 205,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ],
                      ),
                    )
                  : Container(
                     child: slider(_selectedExercise),
                    ),
            ),
            Align(
              alignment: (AlignmentDirectional.bottomEnd),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPressInformationIcon = !isPressInformationIcon;
                  });
                },
                child: Icon(
                  isPressInformationIcon ? Icons.info : Icons.info_outline,
                  color: Theme.of(context).primaryColor,
                  size: _bodyHeight * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
slider(ExerciseItem _selectedExercise) {
  print("xdx ::: ${_selectedExercise.qty_photos}");
  return Container(
    height: 200,
    child: new Swiper(
      autoplay: false,
      itemBuilder: (BuildContext context, int index) {
        return Align(
          child: new Image.asset(
              "assets/images/exercises/exercise-${_selectedExercise.id_exercise}-${index+1}.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        );
      },
      itemCount: int.parse(_selectedExercise.qty_photos),
      pagination: new SwiperPagination(
        margin: EdgeInsets.only(top: 10, bottom: 12.0),
        builder: const DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.white30,
            size: 8.0,
            activeSize: 8.0,
            space: 4.0),
      ),
    ),
  );
}