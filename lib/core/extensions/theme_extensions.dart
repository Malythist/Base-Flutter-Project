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

  Color get gray0 => _isDark ? AppColors.gray0Dark : AppColors.gray0Light;
  Color get gray20 => _isDark ? AppColors.gray20Dark : AppColors.gray20Light;
  Color get gray30 => _isDark ? AppColors.gray30Dark : AppColors.gray30Light;
  Color get gray40 => _isDark ? AppColors.gray40Dark : AppColors.gray40Light;
  Color get gray50 => _isDark ? AppColors.gray50Dark : AppColors.gray50Light;
  Color get gray60 => _isDark ? AppColors.gray60Dark : AppColors.gray60Light;
  Color get gray80 => _isDark ? AppColors.gray80Dark : AppColors.gray80Light;
  Color get gray100 => _isDark ? AppColors.gray100Dark : AppColors.gray100Light;
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