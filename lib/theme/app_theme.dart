import 'package:flutter/material.dart';

import 'app_colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.bg,
  fontFamily: 'Space-Grotesk',
  colorScheme: const ColorScheme.dark(
    primary: AppColors.text,
  ),
);
