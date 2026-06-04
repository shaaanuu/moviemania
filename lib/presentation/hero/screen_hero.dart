import 'package:flutter/material.dart';

import '../explore/screen_explore.dart';
import '../home/screen_home.dart';

class ScreenHero extends StatelessWidget {
  ScreenHero({super.key});

  final ValueNotifier<int> btmnavbarNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ScreenExplore(),
      ScreenHome(),
      // ScreenCategories(moviesList: moviesList),
    ];

    // List<NavigationDestination> navigationDestinations = const [
    //   NavigationDestination(
    //     icon: Icon(Icons.home_outlined),
    //     label: 'Home',
    //     selectedIcon: Icon(Icons.home),
    //   ),
    //   NavigationDestination(
    //     icon: Icon(Icons.category_outlined),
    //     label: 'Categories',
    //     selectedIcon: Icon(Icons.category),
    //   ),
    // ];

    return ValueListenableBuilder(
      valueListenable: btmnavbarNotifier,
      builder: (context, int currentIndex, _) => Scaffold(
        body: pages[currentIndex],
        // bottomNavigationBar: NavigationBar(
        //   destinations: navigationDestinations,
        //   selectedIndex: currentIndex,
        //   onDestinationSelected: (newIndex) =>
        //       btmnavbarNotifier.value = newIndex,
        // ),
      ),
    );
  }
}
