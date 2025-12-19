import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static const String _fontFamily = 'OpenSans';

  static TextTheme textTheme({
    required Color onSurface,
  }) {
    return TextTheme(
      // Android: Typography_Bold_Title (24/28, bold)
      displaySmall: _style(24, 28, FontWeight.w700, onSurface),

      // Android: Typography_Bold_Title2 (22/28, bold)
      headlineMedium: _style(22, 28, FontWeight.w700, onSurface),

      // Android: Typography_Bold_Title3 (20/24, medium)
      headlineSmall: _style(20, 24, FontWeight.w500, onSurface),

      // Android: Typography_Bold_Headline (18/21, medium)
      titleLarge: _style(18, 21, FontWeight.w500, onSurface),

      // Android: Typography_Bold_Text (16/22, medium)
      titleMedium: _style(16, 22, FontWeight.w500, onSurface),

      // Android: Typography_Regular_Text (16/22, regular)
      bodyLarge: _style(16, 22, FontWeight.w400, onSurface),

      // Android: Typography_Bold_TextSmall (14/18, medium)
      bodyMedium: _style(14, 18, FontWeight.w500, onSurface),

      // Android: Typography_Regular_TextSmall (14/18, regular)
      bodySmall: _style(14, 18, FontWeight.w400, onSurface),

      // Android: Typography_Bold_Footnote (13/18, medium)
      labelLarge: _style(13, 18, FontWeight.w500, onSurface),

      // Android: Typography_Regular_Footnote (13/18, regular)
      labelMedium: _style(13, 18, FontWeight.w400, onSurface),

      // Android: Typography_Bold_Caption1 (12/16, medium)
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
      height: lineHeight / fontSize, // ключ: dp/sp -> Flutter height multiplier
      fontWeight: weight,
      color: color,
    );
  }
}
