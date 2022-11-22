import 'package:bibliotek/pages/book_page.dart';
import 'package:bibliotek/pages/Profile/profile_page.dart';
import 'package:bibliotek/pages/home_page.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const HomePage(),
    const BooksPage(),
    const ProfilePage()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(selectedIndex) {
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  void _onPageChanged(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          //physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Ma biblio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account_rounded),
                label: 'Profile',
              )
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xff53EBC4)));
  }
}
