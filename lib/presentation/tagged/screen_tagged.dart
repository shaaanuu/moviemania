import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../theme/text_styles.dart';

class ScreenTagged extends StatelessWidget {
  const ScreenTagged({super.key});

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
                "Tagged",
                style: AppTextStyles.title.copyWith(fontSize: 30),
              ),
              PhosphorIcon(PhosphorIconsDuotone.user, size: 32),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 175 / 260,
            ),
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(14),
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
                  Positioned(
                    bottom: 16,
                    left: 14,
                    right: 14,
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/noise/LDR_RGBA_0_512x512.png',
                                fit: BoxFit.fill,
                                height: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Project Hail Mary'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.title.copyWith(
                                      fontSize: 14,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  Text(
                                    'Science Fiction - 2026',
                                    style: AppTextStyles.subtitle.copyWith(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
