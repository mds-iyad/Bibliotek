import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late PageController _pageController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff333333),
                      shadowColor: const Color(0xff53EBC4)),
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(demo_data.length,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    });
                  },
                  child: const Text("Skip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: const Color(0xff53EBC4),
                          foregroundColor: const Color(0xff333333)),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: const Icon(Icons.arrow_forward_rounded)),
                ),
                const SizedBox(width: 35)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  // final Widget passWidget;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    // required this.passWidget
  });
}

final List<Onboard> demo_data = [
  Onboard(
      image:
          "assets/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title text 1",
      description: "description text"),
  Onboard(
      image:
          "assets/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title text 2",
      description: "description text"),
  Onboard(
      image:
          "assets/pngtree-cartoon-hand-drawn-teamwork-puzzle-illustration-png-image_1692063.jpeg",
      title: "title text 3",
      description: "description text"),
];

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
