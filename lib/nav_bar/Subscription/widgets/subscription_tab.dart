import 'package:flutter/material.dart';

class AppSegmentedTabItem {
  final String label;
  final Widget? icon;

  const AppSegmentedTabItem({required this.label, this.icon});
}

class AppSegmentedTab extends StatelessWidget {
  final List<AppSegmentedTabItem> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  final double height;

  final double itemHeight;

  final double borderRadius;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color borderColor;

  // selected
  final Gradient? selectedGradient;
  final Color? selectedColor;
  final Color selectedTextColor;
  final Color selectedIconColor;

  // unselected
  final Color? unselectedItemColor;
  final Color unselectedTextColor;
  final Color unselectedIconColor;

  const AppSegmentedTab({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
    this.height = 56,
    this.itemHeight = 44,
    this.borderRadius = 14,
    this.padding = const EdgeInsets.all(6),
    this.backgroundColor,
    this.borderColor = const Color(0xFFE5E7EB),

    this.selectedGradient,
    this.selectedColor,
    this.selectedTextColor = Colors.white,
    this.selectedIconColor = Colors.white,

    this.unselectedItemColor,
    this.unselectedTextColor = const Color(0xFF6B7280),
    this.unselectedIconColor = const Color(0xFF6B7280),
  });

  @override
  Widget build(BuildContext context) {
    assert(items.length >= 2, 'AppSegmentedTab needs at least 2 items');

    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == selectedIndex;

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged(index),
              child: Center(
                child: AnimatedContainer(
                  height: itemHeight, // ✅ pill height
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? selectedColor
                        : (unselectedItemColor ?? Colors.transparent),
                    gradient: isSelected ? selectedGradient : null,
                    borderRadius: BorderRadius.circular(borderRadius - 4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (item.icon != null) ...[
                        IconTheme(
                          data: IconThemeData(
                            size: 18,
                            color: isSelected
                                ? selectedIconColor
                                : unselectedIconColor,
                          ),
                          child: item.icon!,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? selectedTextColor
                                : unselectedTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
