import 'package:flutter/material.dart';
import 'app_colors.dart';

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

      background: AppColors.grayLight50,
      onBackground: Colors.black,

      surface: AppColors.grayLight100,
      onSurface: Colors.black,

      surfaceVariant: AppColors.grayLight200,
      outline: AppColors.grayLight400,

      error: Colors.red,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      dividerColor: AppColors.grayLight300,
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

      background: AppColors.grayDark50,
      onBackground: Colors.white,

      surface: AppColors.grayDark100,
      onSurface: Colors.white,

      surfaceVariant: AppColors.grayDark200,
      outline: AppColors.grayDark400,

      error: Colors.redAccent,
      onError: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      dividerColor: AppColors.grayDark300,
    );
  }
}