import 'package:flutter/material.dart';
import 'package:abc_app/core/constant/color_constant.dart';
import 'package:abc_app/core/components/text_style.dart';

enum BillingCycle { monthly, yearly }

class SubscriptionTab extends StatelessWidget {
  final BillingCycle value;
  final ValueChanged<BillingCycle> onChanged;

  const SubscriptionTab({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorConstant.infocontainerwhite,
        // gradient: const LinearGradient(
        //   colors: [Color(0xff155DFC), Color(0xff9810FA)],
        // ),
      ),
      child: Row(
        children: [
          _tabItem(
            title: 'Monthly',
            isSelected: value == BillingCycle.monthly,
            onTap: () => onChanged(BillingCycle.monthly),
          ),
          SizedBox(width: 5),
          _tabItem(
            title: 'Yearly',
            isSelected: value == BillingCycle.yearly,
            onTap: () => onChanged(BillingCycle.yearly),
          ),
        ],
      ),
    );
  }

  Widget _tabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          // curve: Curves.easeInOut,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: primaryTextStyle(
              size: 14,
              weight: FontWeight.w400,
              color: isSelected ? ColorConstant.blue : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
