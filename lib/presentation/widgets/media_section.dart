import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../../theme/text_styles.dart';
import 'backdrop_widget.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 24, left: 16),
          child: Text(
            title,
            style: AppTextStyles.title.copyWith(fontSize: 16),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 160,
            enlargeCenterPage: true,
            enlargeFactor: 0.15,
          ),
          items: [
            BackdropWidget(),
            BackdropWidget(),
            BackdropWidget(),
          ],
        ),
      ],
    );
  }
}
