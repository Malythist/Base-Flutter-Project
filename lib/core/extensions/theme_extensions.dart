import 'package:flutter/material.dart';
import '../../shared/design/app_colors.dart';

extension ThemeExtensions on BuildContext {
  AppThemeColors get colors => AppThemeColors._(this);
  AppThemeText get text => AppThemeText._(this);
}

class AppThemeColors {
  AppThemeColors._(this._context);

  final BuildContext _context;

  ThemeData get _theme => Theme.of(_context);
  ColorScheme get _scheme => _theme.colorScheme;

  bool get _isDark => _scheme.brightness == Brightness.dark;

  Color get primary => _scheme.primary;
  Color get onPrimary => _scheme.onPrimary;
  Color get background => _isDark ? AppColors.pageBackgroundDark : AppColors.pageBackgroundLight;
  Color get cardViewBackground => _isDark ? AppColors.cardViewDark : AppColors.cardViewLight;
  Color get surface => _isDark ? AppColors.pageBackgroundDark : AppColors.pageBackgroundLight;
  Color get onSurface => _isDark ? AppColors.pageBackgroundDark : AppColors.pageBackgroundLight;

  Color get textPrimary => _isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
  Color get textSecondary => _isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
  Color get textTertiary => _isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

  Color get surfaceVariant => _scheme.surfaceContainerHighest;

  Color get gray50 => _isDark ? AppColors.grayDark50 : AppColors.grayLight50;
  Color get gray100 => _isDark ? AppColors.grayDark100 : AppColors.grayLight100;
  Color get gray200 => _isDark ? AppColors.grayDark200 : AppColors.grayLight200;
  Color get gray300 => _isDark ? AppColors.grayDark300 : AppColors.grayLight300;
  Color get gray400 => _isDark ? AppColors.grayDark400 : AppColors.grayLight400;
  Color get gray500 => _isDark ? AppColors.grayDark500 : AppColors.grayLight500;
  Color get gray600 => _isDark ? AppColors.grayDark600 : AppColors.grayLight600;

  Color get gray20 => gray200;
  Color get gray40 => gray500;
}

class AppThemeText {
  AppThemeText._(this._context);

  final BuildContext _context;

  TextTheme get _text => Theme.of(_context).textTheme;

  TextStyle? get headlineSmall => _text.headlineSmall;

  TextStyle? get headlineMedium => _text.headlineMedium;
  TextStyle? get bodyLarge => _text.bodyLarge;

  TextStyle? get titleMedium => _text.titleMedium;
  TextStyle? get labelMedium => _text.labelMedium;
  TextStyle? get bodySmall => _text.bodySmall;
}