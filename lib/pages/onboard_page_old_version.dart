// ignore_for_file: use_build_context_synchronously

import 'package:bibliotek/constant/constant.dart';
import 'package:bibliotek/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<Onboard> demo_data = [
    Onboard(
      image:
          "assets/images/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title 1 ",
      description: "description 1",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
    Onboard(
      image:
          "assets/images/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title 2",
      description: "description 2",
      bg: const Color(0xFF4756DF),
      button: Colors.white,
    ),
    Onboard(
      image:
          "assets/images/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title 3",
      description: "description 3",
      bg: Colors.white,
      button: const Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      appBar: AppBar(
          backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                _storeOnboardInfo();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MasterPage()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: currentIndex % 2 == 0 ? kblack : kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ]),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(demo_data[index].image),
                      SizedBox(
                        height: 10.0,
                        child: ListView.builder(
                          itemCount: demo_data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    width: currentIndex == index ? 25 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? kbrown
                                          : kbrown300,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ]);
                          },
                        ),
                      ),
                      Text(
                        demo_data[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: index % 2 == 0 ? kblack : kwhite,
                        ),
                      ),
                      Text(
                        demo_data[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Montserrat',
                          color: index % 2 == 0 ? kblack : kwhite,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (index == demo_data.length - 1) {
                            await _storeOnboardInfo();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MasterPage()));
                          }

                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10),
                          decoration: BoxDecoration(
                              color: index % 2 == 0 ? kblue : kwhite,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: index % 2 == 0 ? kwhite : kblue),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: index % 2 == 0 ? kwhite : kblue,
                            )
                          ]),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  final Color bg, button;
  // final Widget passWidget;

  Onboard(
      {required this.image,
      required this.title,
      required this.description,
      required this.bg,
      required this.button
      // required this.passWidget
      });
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}
