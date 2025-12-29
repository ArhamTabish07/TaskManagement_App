import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  static const _gradient = LinearGradient(
    colors: [Color(0xFF155DFC), Color(0xFF9810FA)],
  );

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10 + bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: Offset(0, -2),
            color: Color(0x14000000),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const itemCount = 4;
          const gap = 10.0;

          final totalGap = gap * (itemCount - 1);
          final itemWidth = (constraints.maxWidth - totalGap) / itemCount;

          // move pill by (itemWidth + gap) each index
          final pillLeft = currentIndex * (itemWidth + gap);

          return SizedBox(
            height: 52,
            child: Stack(
              children: [
                // ✅ sliding pill
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOutCubic,
                  left: pillLeft,
                  top: 0,
                  bottom: 0,
                  width: itemWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: _gradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                // tabs row
                Row(
                  children: [
                    _Item(
                      width: itemWidth,
                      label: "Home",
                      icon: Icons.home_rounded,
                      selected: currentIndex == 0,
                      onTap: () => onChanged(0),
                    ),
                    const SizedBox(width: gap),
                    _Item(
                      width: itemWidth,
                      label: "Subscription",
                      icon: Icons.credit_card_rounded,
                      selected: currentIndex == 1,
                      onTap: () => onChanged(1),
                    ),
                    const SizedBox(width: gap),
                    _Item(
                      width: itemWidth,
                      label: "Messages",
                      icon: Icons.chat,
                      selected: currentIndex == 2,
                      onTap: () => onChanged(2),
                    ),
                    const SizedBox(width: gap),
                    _Item(
                      width: itemWidth,
                      label: "Profile",
                      icon: Icons.person_outline_rounded,
                      selected: currentIndex == 3,
                      onTap: () => onChanged(3),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final double width;
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _Item({
    required this.width,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final unselected = const Color(0xFF9CA3AF);

    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20, color: selected ? Colors.white : unselected),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  height: 1.0,
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : unselected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
