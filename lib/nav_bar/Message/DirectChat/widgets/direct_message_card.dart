import 'package:flutter/material.dart';
import 'package:task_management_app/core/components/gradient_container.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/components/white_container.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/constant/icon_constant.dart';

class DirectMessageCard extends StatelessWidget {
  const DirectMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 87,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      IconConstants.directchaticon,
                      width: 56,
                      height: 56,
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sarah Johnson',
                            style: primaryTextStyle(
                              color: ColorConstant.black,
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          // SizedBox(width: 80),
                          Text(
                            '2:15 PM',
                            style: primaryTextStyle(
                              color: ColorConstant.grey,
                              size: 12,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'See you tomorrow!',
                            style: primaryTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          // SizedBox(width: 40),
                          GradientContainer(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Text(
                                '1',
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Spacer(),

                // Column(children: [Image.asset(IconConstants.arrowright)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
