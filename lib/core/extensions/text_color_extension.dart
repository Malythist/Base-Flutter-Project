import 'package:flutter/material.dart';

extension TextStyleColorExtension on TextStyle? {
  TextStyle? color(Color color) {
    return this?.copyWith(color: color);
  }
}