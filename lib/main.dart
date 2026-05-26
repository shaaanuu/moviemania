import 'package:flutter/material.dart';

import 'presentation/hero/screen_hero.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1e1e2e),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFcdd6f4)),
        ),
      ),
      home: ScreenHero(),
    );
  }
}
