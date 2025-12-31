import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static const String _fontFamily = 'OpenSans';

  static TextTheme textTheme({
    required Color onSurface,
  }) {
    return TextTheme(
      displaySmall: _style(24, 28, FontWeight.w700, onSurface),

      headlineMedium: _style(22, 28, FontWeight.w700, onSurface),

      headlineSmall: _style(20, 24, FontWeight.w500, onSurface),

      titleLarge: _style(18, 21, FontWeight.w500, onSurface),

      titleMedium: _style(16, 22, FontWeight.w500, onSurface),

      bodyLarge: _style(16, 22, FontWeight.w400, onSurface),

      bodyMedium: _style(14, 18, FontWeight.w500, onSurface),

      bodySmall: _style(14, 18, FontWeight.w400, onSurface),

      labelLarge: _style(13, 18, FontWeight.w500, onSurface),

      labelMedium: _style(13, 18, FontWeight.w400, onSurface),

      labelSmall: _style(12, 16, FontWeight.w500, onSurface),
    );
  }

  static TextStyle _style(
      double fontSize,
      double lineHeight,
      FontWeight weight,
      Color color,
      ) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      height: lineHeight / fontSize,
      fontWeight: weight,
      color: color,
    );
  }
}
