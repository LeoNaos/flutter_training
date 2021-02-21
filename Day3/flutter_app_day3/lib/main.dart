import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/userprofile/pages/home_page.dart';
import 'package:flutter_app_day3/modules/userprofile/states/user_state.dart';
import 'package:flutter_app_day3/providers/theme_provider.dart';
import 'package:flutter_app_day3/themes/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(create: (_) => UserState()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ],
      child: _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Ex03',
      theme:
          Provider.of<ThemeProvider>(context).currentTheme == ThemeState.light
              ? AppTheme.setLightTheme()
              : AppTheme.setDarkTheme(),
      home: HomePage(),
    );
  }
}
