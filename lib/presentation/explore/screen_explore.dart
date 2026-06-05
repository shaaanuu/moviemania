import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../api/tmdb.dart';
import '../../theme/text_styles.dart';
import '../widgets/media_section.dart';

class ScreenExplore extends StatelessWidget {
  const ScreenExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore",
                style: AppTextStyles.title.copyWith(fontSize: 30),
              ),
              PhosphorIcon(PhosphorIconsDuotone.user, size: 32),
            ],
          ),
        ),
        MediaSection(title: 'Trending Today', loader: TMDB.trendingDay),
        MediaSection(title: 'Top Rated', loader: TMDB.topRated),
        MediaSection(title: 'Upcoming', loader: TMDB.upcoming),
        SizedBox(height: 100),
      ],
    );
  }
}
