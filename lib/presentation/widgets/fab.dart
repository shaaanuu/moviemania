import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../theme/app_colors.dart';

class Fab extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const Fab({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

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
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(25),
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
              borderRadius: BorderRadius.circular(25),
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
                          _fabItem(PhosphorIconsDuotone.house, 0),
                          const SizedBox(width: 4),
                          _fabItem(PhosphorIconsDuotone.binoculars, 1),
                          const SizedBox(width: 4),
                          _fabItem(PhosphorIconsDuotone.floppyDisk, 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          _searchButton(),
        ],
      ),
    );
  }

  Widget _fabItem(IconData icn, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/noise/LDR_RGBA_0_512x512.png'),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(),
        child: IconButton(
          icon: PhosphorIcon(
            icn,
            size: 32,
            color: AppColors.text,
          ),
          onPressed: () => onItemSelected(index),
        ),
      ),
    );
  }

  Widget _searchButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
    );
  }
}
