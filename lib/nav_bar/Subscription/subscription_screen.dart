import 'package:abc_app/core/components/Header_card.dart';
import 'package:abc_app/core/components/custom_icon_container.dart';
import 'package:abc_app/core/components/text_style.dart';
import 'package:abc_app/core/constant/icon_constant.dart';
import 'package:abc_app/nav_bar/Subscription/widgets/subscription_plan_card.dart';
import 'package:abc_app/nav_bar/Subscription/widgets/subscription_tab.dart';
import 'package:flutter/material.dart';

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

                      // ✅ Monthly / Yearly toggle
                      SubscriptionTab(
                        value: cycle,
                        onChanged: (newCycle) {
                          setState(() => cycle = newCycle);
                        },
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
