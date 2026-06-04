import 'package:flutter/material.dart';

import '../explore/screen_explore.dart';
import '../home/screen_home.dart';
import '../widgets/fab.dart';

class ScreenHero extends StatelessWidget {
  ScreenHero({super.key});

  final ValueNotifier<int> btmnavbarNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ScreenExplore(),
      ScreenHome(),
    ];

    return ValueListenableBuilder(
      valueListenable: btmnavbarNotifier,
      builder: (context, int currentIndex, _) => Scaffold(
        body: pages[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Fab(),
      ),
    );
  }
}
