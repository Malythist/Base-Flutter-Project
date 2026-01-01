import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: Colors.white,
      secondary: AppColors.secondaryLight,
      onSecondary: Colors.white,
      tertiary: AppColors.tertiaryLight,
      onTertiary: Colors.white,
      background: AppColors.gray0Light,
      onBackground: Colors.black,
      surface: AppColors.gray20Light,
      onSurface: Colors.black,
      surfaceVariant: AppColors.gray40Light,
      outline: AppColors.gray40Light,
      error: Colors.red,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      dividerColor: AppColors.gray30Light,
      textTheme: AppTypography.textTheme(onSurface: scheme.onSurface),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: Colors.black,
      secondary: AppColors.secondaryDark,
      onSecondary: Colors.black,
      tertiary: AppColors.tertiaryDark,
      onTertiary: Colors.black,
      background: AppColors.gray0Dark,
      onBackground: Colors.white,
      surface: AppColors.gray20Dark,
      onSurface: Colors.white,
      surfaceVariant: AppColors.gray20Dark,
      outline: AppColors.gray40Dark,
      error: Colors.redAccent,
      onError: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      dividerColor: AppColors.gray30Dark,
      textTheme: AppTypography.textTheme(onSurface: scheme.onSurface),
    );
  }
}