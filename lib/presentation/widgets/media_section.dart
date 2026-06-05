import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../../theme/text_styles.dart';
import 'backdrop_widget.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({
    super.key,
    required this.title,
    required this.loader,
  });

  final String title;
  final Future<List<MovieModel>> Function() loader;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loader(),
      builder: (context, snapshot) {
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
              items: snapshot.data == null
                  ? []
                  : snapshot.data!
                      .map((e) => BackdropWidget(movie: e))
                      .toList(),
            ),
          ],
        );
      },
    );
  }
}
