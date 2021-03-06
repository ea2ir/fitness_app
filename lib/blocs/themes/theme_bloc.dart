import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/enums/app_themes.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int defaultValue=0;
  @override
  ThemeState get initialState => ThemeInitial(appThemeData[AppTheme.values[defaultValue]]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeInitial(appThemeData[event.theme]);
    }
  }
}
