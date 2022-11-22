import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bibliotek/pages/master_page.dart';
import 'package:bibliotek/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bibliotek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Splash(),
      // home: AnimatedSplashScreen(
      //   splash: const Splash(),
      //   nextScreen: const MasterPage(),
      //   duration: 3000,
      //   splashTransition: SplashTransition.fadeTransition,
      // ),
    );
  }
}
