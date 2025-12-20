import 'package:flutter/material.dart';
import '../../core/extensions/theme_extensions.dart';
import '../design/app_colors.dart';
import '../design/app_spacing.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled && onPressed != null;
    final bgColor = isEnabled ? context.colors.primary : AppColors.grayLight400; // gray_40
    final fgColor = isEnabled ? context.colors.onPrimary : AppColors.grayLight600; // gray_60

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: AppSpacing.buttonBorderRadius,
          ),
        ),
        child: Text(
          title,
          style: context.text.titleMedium?.copyWith(color: fgColor),
        ),
      ),
    );
  }
}