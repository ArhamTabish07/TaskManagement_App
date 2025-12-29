import 'package:flutter/material.dart';
import 'package:task_management_app/core/components/custom_button.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/components/white_container.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/constant/icon_constant.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String planType;
  final String planPrice;

  const SubscriptionPlanCard({
    super.key,
    required this.planType,
    required this.planPrice,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 454,

      child: Padding(
        padding: const EdgeInsets.only(
          top: 26.0,
          bottom: 26,
          left: 26,
          right: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                planType,
                style: primaryTextStyle(size: 18, color: ColorConstant.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$',
                  style: primaryTextStyle(size: 18, color: ColorConstant.grey),
                ),
                Text(
                  planPrice,
                  style: primaryTextStyle(
                    size: 36,
                    color: ColorConstant.purple,
                  ),
                ),
                // Text(' / month'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),
                Text(
                  'Unlimited companies',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Up to 50 members per company',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Attendance tracking',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Task management',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Leave management',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Basic analytics',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              children: [
                Image.asset(IconConstants.checkicon, height: 18, width: 18),
                SizedBox(width: 12),

                Text(
                  'Email support',
                  style: primaryTextStyle(
                    color: ColorConstant.darkgrey,
                    size: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Subscribe Now',
              height: 48,

              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
