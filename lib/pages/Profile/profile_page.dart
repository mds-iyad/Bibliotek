import 'package:bibliotek/pages/Profile/profile_icon.dart';
import 'package:bibliotek/pages/Profile/profile_menu.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
          foregroundColor: Colors.black87,
          backgroundColor: const Color(0xff53EBC4),
          title: const Text("Profile")),
      body: Center(
        child: SafeArea(
          child: Column(children: [
            const SizedBox(height: 30),
            const ProfileIcon(),
            const SizedBox(height: 20),
            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 193, 204, 212),
                    spreadRadius: -8,
                    blurRadius: 21.0,
                    offset: Offset(10, 10),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    blurRadius: 6,
                    offset: Offset(-3, -4),
                  )
                ]),
                child: ProfileMenu(
                  text: "Account Settings",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                  shapeRound: 15,
                )),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 193, 204, 212),
                      spreadRadius: -8,
                      blurRadius: 21.0,
                      offset: Offset(10, 10),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      blurRadius: 6,
                      offset: Offset(-3, -4),
                    )
                  ]),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  ProfileMenu(
                    text: "Language",
                    icon: "assets/icons/User Icon.svg",
                    shapeRound: 0,
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: "Feedback",
                    icon: "assets/icons/bell.svg",
                    shapeRound: 0,
                    press: () {},
                  ),
                  ProfileMenu(
                    text: "Rate us",
                    icon: "assets/icons/bell.svg",
                    shapeRound: 0,
                    press: () {},
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
