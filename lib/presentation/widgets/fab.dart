import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../theme/app_colors.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      backgroundColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      elevation: 0,
      onPressed: () {},
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black25,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(
                        'assets/noise/LDR_RGBA_0_512x512.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _fabItem(PhosphorIconsDuotone.house),
                          const SizedBox(width: 12),
                          _fabItem(PhosphorIconsDuotone.binoculars),
                          const SizedBox(width: 12),
                          _fabItem(PhosphorIconsDuotone.floppyDisk),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.bg,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black25,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipOval(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(
                        'assets/noise/LDR_RGBA_0_512x512.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      icon: PhosphorIcon(
                        PhosphorIconsDuotone.magnifyingGlass,
                        size: 32,
                        color: AppColors.text,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _fabItem(IconData icn) {
  return IconButton(
    icon: PhosphorIcon(
      icn,
      size: 32,
      color: AppColors.text,
    ),
    onPressed: () {},
  );
}
