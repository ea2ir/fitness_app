import 'package:fitnessapp/blocs/themes/theme_bloc.dart';
import 'package:fitnessapp/ui/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      theme: state.themeData,
      home: SplashScreen(),
    );
  }
}
