import 'package:abc_app/Tab/Home/core/constant/IconConstant.dart';
import 'package:abc_app/components/text_style.dart';
import 'package:abc_app/components/white_container.dart';
import 'package:abc_app/Tab/Home/core/constant/ColorConstant.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      IconConstants.defaultgrouplogo,
                      width: 56,
                      height: 56,
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      'ABC Company',
                      style: primaryTextStyle(
                        color: ColorConstant.black,
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Main office team',
                      style: primaryTextStyle(
                        color: ColorConstant.darkgrey,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),

                Column(children: [Image.asset(IconConstants.arrowright)]),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                // Image.asset(IconConstants.defaultgrouplogo),
                SizedBox(width: 8),
                Text(
                  '24 members',
                  style: primaryTextStyle(
                    color: ColorConstant.grey,
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Container(
                  width: 65,
                  height: 21,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightgreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Member',
                      style: primaryTextStyle(
                        color: ColorConstant.darkgreen,
                        size: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
