import 'package:flutter/material.dart';
import 'package:tap_2/screens/dashboard_screen.dart';
import 'package:tap_2/screens/detail_popular.dart';
import 'package:tap_2/screens/popular_screen.dart';
import 'package:tap_2/screens/splash_screen.dart';
import 'package:tap_2/screens/Challenge/ui_challenge_3.dart';
import 'package:tap_2/settings/global_values.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.banThemeDark, 
      builder: (context, value,_) {
        return MaterialApp(
          theme: value ? ThemeData.dark() : ThemeData.light() ,
          title: 'Material App',
          routes: {
            "/dash" : (context) => const DashboardScreen(),
            '/challenge': (context) =>  const UiChallenge3(),
            '/movies': (context) => const PopularScreen(),
            '/detail': (context) => const DetailPopular()
          },
          home: const SplashScreen()
        );
      }
    );
  }
}