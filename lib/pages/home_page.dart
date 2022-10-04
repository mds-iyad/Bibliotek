import 'package:bibliotek/pages/onboard_page.dart';
import 'package:bibliotek/pages/signin_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SigninPage()));
  }

  void onPressed2() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const OnBoardPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          width: 200,
          child: TextButton(
            onPressed: onPressed,
            child: const Text("sign up page"),
          ),
        ),
        SizedBox(
          width: 200,
          child: TextButton(
            onPressed: onPressed2,
            child: const Text("on board"),
          ),
        ),
      ]),
    );
  }
}
