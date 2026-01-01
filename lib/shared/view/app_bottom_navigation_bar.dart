import 'package:flutter/material.dart';
import 'package:base_multiplatform_project/core/extensions/theme_extensions.dart';

@immutable
class AppBottomNavItem {
  const AppBottomNavItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.items,
    required this.onChanged,
    this.selectedIndex = 0,
    this.backgroundColor,
  });

  final List<AppBottomNavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final Color? backgroundColor;

  static const double height = 56;
  static const double _topDividerHeight = 1;
  static const double _iconSize = 24;
  static const double _iconTextSpacing = 2;

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.colors.gray20;
    final inactiveColor = context.colors.gray40;
    final activeColor = context.colors.primary;
    final surfaceColor = backgroundColor ?? context.colors.cardViewBackground;

    final screenWidth = MediaQuery.sizeOf(context).width;
    final itemWidth = items.isEmpty ? 0.0 : screenWidth / items.length;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        color: surfaceColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: _topDividerHeight,
              color: dividerColor,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  final isSelected = index == selectedIndex;
                  final itemColor = isSelected ? activeColor : inactiveColor;

                  return SizedBox(
                    width: itemWidth,
                    child: _BottomNavButton(
                      icon: item.icon,
                      label: item.label,
                      color: itemColor,
                      textStyle: context.text.bodySmall,
                      iconSize: _iconSize,
                      iconTextSpacing: _iconTextSpacing,
                      onTap: () => onChanged(index),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textStyle,
    required this.iconSize,
    required this.iconTextSpacing,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final TextStyle? textStyle;
  final double iconSize;
  final double iconTextSpacing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        final double radius = w / 4;

        return SizedBox.expand(
          child: Material(
            type: MaterialType.transparency,
            child: InkResponse(
              onTap: onTap,

              containedInkWell: false,
              highlightShape: BoxShape.circle,
              radius: radius,

              highlightColor: Colors.transparent,

              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: iconSize, color: color),
                    SizedBox(height: iconTextSpacing),
                    Text(
                      label,
                      style: (textStyle ?? const TextStyle()).copyWith(color: color),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}