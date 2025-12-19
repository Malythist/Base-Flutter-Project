import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

extension ImageUrlExtension on String {
  Widget networkImage({
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    final image = CachedNetworkImage(
      imageUrl: this,
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, __) =>
      placeholder ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (_, __, ___) =>
      errorWidget ?? const Icon(Icons.broken_image),
    );

    if (borderRadius == null) return image;

    return ClipRRect(
      borderRadius: borderRadius,
      child: image,
    );
  }
}