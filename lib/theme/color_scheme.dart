import 'package:dcy_wallet/theme/swatch_color.dart';
import 'package:flutter/material.dart';

final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primarySwatch,
  onPrimary: onPrimarySwatch,
  secondary: secondarySwatch,
  onSecondary: onSecondarySwatch,
  onTertiary: onTertiarySwatch,
  error: errorSwatch,
  onError: const Color(0xFFFFFFFF),
  background:  const Color(0xFF080A0C),
  onBackground: const Color(0xFFFFFFFF),
  surface: surfaceSwatch,
  onSurface: const Color(0xFFFFFFFF),
);