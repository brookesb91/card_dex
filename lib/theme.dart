import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color primary = Color(0xFFE4000F);
  static const Color secondary = Color(0xFFE8E8E8);
}

final theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Palette.primary,
    secondary: Palette.secondary,
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Palette.primary,
    secondary: Palette.secondary,
  ),
);
