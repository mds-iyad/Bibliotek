import 'package:bibliotek/pages/master_page.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const MasterPage(),
    );
  }
}
