import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../api/tmdb.dart';
import '../../model/movie.dart';
import '../../theme/text_styles.dart';
import '../widgets/media_section.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  Future<List<MovieModel>> _load() => TMDB.trendingDay();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 580,
          child: FutureBuilder<List<MovieModel>>(
            future: _load(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const CircularProgressIndicator());
              }

              final datas = snapshot.data!;

              return Stack(
                children: [
                  Image.network(
                    datas[0].imageUrl,
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.saturation,
                    color: Colors.white,
                  ),
                  Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/noise/LDR_RGBA_0_512x512.png',
                      fit: BoxFit.cover,
                      height: 580,
                    ),
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x80000000),
                            Color(0x40000000),
                            Color(0x00000000),
                            Color(0x40000000),
                            Color(0x801C1C1C),
                            Color(0x801C1C1C),
                          ],
                          stops: [0, .25, .5, .75, .95, 1],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Moviemania",
                          style: AppTextStyles.title.copyWith(fontSize: 30),
                        ),
                        PhosphorIcon(PhosphorIconsDuotone.user, size: 32),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 24,
                    right: 24,
                    child: SizedBox(
                      height: 90,
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'assets/noise/LDR_RGBA_0_512x512.png',
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    datas[0].title.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.title.copyWith(
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    datas[0].genres.join(' - '),
                                    style: AppTextStyles.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
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
