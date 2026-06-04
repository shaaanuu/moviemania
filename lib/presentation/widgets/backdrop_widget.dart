import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class BackdropWidget extends StatelessWidget {
  const BackdropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 280,
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/2I1OFQJ0L9T0dpU6FobKFWV2PxX.jpg',
              colorBlendMode: BlendMode.saturation,
              color: Colors.white,
              width: double.infinity,
            ),
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/noise/LDR_RGBA_0_512x512.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF000000),
                        Color(0xBF000000),
                        Color(0x40000000),
                        Color(0xBF000000),
                        Color(0xFF000000),
                      ],
                      stops: [0, .25, .5, .75, 1],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'assets/noise/LDR_RGBA_0_512x512.png',
                        fit: BoxFit.cover,
                        height: 45,
                        width: 130,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Text(
                        'Project Hail Mary',
                        style: AppTextStyles.subtitle,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        'Science Fiction - 2026',
                        style: AppTextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.text75,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/noise/LDR_RGBA_0_512x512.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'movie',
                        style: AppTextStyles.subtitle.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/noise/LDR_RGBA_0_512x512.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      height: 20,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '8.6',
                              style: AppTextStyles.subtitle.copyWith(
                                fontSize: 8,
                              ),
                            ),
                            const SizedBox(width: 2),
                            PhosphorIcon(
                              PhosphorIconsDuotone.star,
                              size: 8,
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
    );
  }
}
