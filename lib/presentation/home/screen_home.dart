import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../theme/text_styles.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 580,
          child: Stack(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/yihdXomYb5kTeSivtFndMy5iDmf.jpg',
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
                                'Project Hail Mary'.toUpperCase(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.title.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'Science Fiction - 2026',
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
          ),
        ),
      ],
    );
  }
}
