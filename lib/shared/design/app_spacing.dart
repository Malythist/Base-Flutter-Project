import 'package:flutter/material.dart';

class AppSpacing {
  const AppSpacing._();

  static const double defaultPadding = 20;
  static const double buttonHeight = 48;
  static const double buttonRadius = 8;
  static const BorderRadius buttonBorderRadius =
  BorderRadius.all(Radius.circular(buttonRadius));

  static const EdgeInsets all = EdgeInsets.all(defaultPadding);
  static const EdgeInsets horizontal =
  EdgeInsets.symmetric(horizontal: defaultPadding);
  static const EdgeInsets vertical =
  EdgeInsets.symmetric(vertical: defaultPadding);
}