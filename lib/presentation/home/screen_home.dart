import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Moviemania",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
