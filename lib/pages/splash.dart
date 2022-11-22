import 'package:bibliotek/main.dart';
import 'package:bibliotek/pages/master_page.dart';
import 'package:bibliotek/pages/onboard_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isViewed != 0 ? const OnBoardPage() : const MasterPage()));
    //const OnBoardPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null /* add child content here */,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo-noir.png',
                      width: 200, height: 200),
                  const SizedBox(height: 10),
                  const Text(
                    "Bibliotek",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
