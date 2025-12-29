import 'package:flutter/material.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/constant/icon_constant.dart';
import 'package:task_management_app/nav_bar/Subscription/widgets/subscription_plan_card.dart';
import 'package:task_management_app/nav_bar/Subscription/widgets/subscription_tab.dart';

// ✅ reuse this import where you placed AppSegmentedTab

enum BillingCycle { monthly, yearly }

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  BillingCycle cycle = BillingCycle.monthly;

  @override
  Widget build(BuildContext context) {
    // ✅ ONLY values change based on cycle
    final String planType = cycle == BillingCycle.monthly
        ? 'Monthly Plan'
        : 'Yearly Plan';

    final String planPrice = cycle == BillingCycle.monthly ? '29' : '199';

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                HeaderCard(height: 185),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomiconContainer(
                            width: 48,
                            height: 48,
                            borderRadius: 100,
                            icon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                IconConstants.subscriptionCard,
                                height: 22,
                                width: 22,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subscription Plans',
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 22,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Choose the perfect plan',
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 12,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // ✅ segmented tab
                      AppSegmentedTab(
                        selectedIndex: cycle == BillingCycle.monthly ? 0 : 1,
                        onChanged: (i) {
                          setState(() {
                            cycle = i == 0
                                ? BillingCycle.monthly
                                : BillingCycle.yearly;
                          });
                        },
                        items: const [
                          AppSegmentedTabItem(label: 'Monthly'),
                          AppSegmentedTabItem(label: 'Yearly'),
                        ],

                        height: 46,
                        borderRadius: 14,

                        backgroundColor: ColorConstant.infocontainerwhite,
                        borderColor: Colors.white.withOpacity(0.22),

                        selectedColor: Colors.white,
                        selectedGradient: null,
                        selectedTextColor: ColorConstant.blue,

                        unselectedItemColor: Colors.transparent,
                        unselectedTextColor: Colors.white,
                        unselectedIconColor: Colors.white,
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
              child: SubscriptionPlanCard(
                planType: planType,
                planPrice: planPrice,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
