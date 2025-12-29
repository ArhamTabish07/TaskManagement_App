import 'package:abc_app/core/components/Header_card.dart';
import 'package:abc_app/core/components/custom_icon_container.dart';
import 'package:abc_app/core/components/custom_info_container.dart';
import 'package:abc_app/core/components/custom_textfield.dart';
import 'package:abc_app/core/components/text_style.dart';
import 'package:abc_app/core/constant/color_constant.dart';
import 'package:abc_app/core/constant/icon_constant.dart';
import 'package:abc_app/core/service/navigation_service.dart';
import 'package:abc_app/nav_bar/Home/Group/create_group_screen.dart';
import 'package:abc_app/nav_bar/Home/widgets/group_card.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  HeaderCard(height: 180),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Messages',
                                  style: primaryTextStyle(
                                    size: 22,
                                    weight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Chat with your team',
                                  style: primaryTextStyle(
                                    color: Colors.white,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            CustomiconContainer(
                              width: 48,
                              height: 48,
                              borderRadius: 100,
                              icon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomTextfield(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                            color: ColorConstant.lightgrey,
                          ),
                          fillColor: Colors.white,
                          hint: Text(
                            'Search messages...',
                            style: primaryTextStyle(
                              size: 14,
                              color: ColorConstant.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('My Groups', style: primaryTextStyle(size: 20)),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            gradient: const LinearGradient(
                              colors: [Color(0xff155DFC), Color(0xff9810FA)],
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              NavigationService().navigateToScreen(
                                nextScreen: CreateGroupScreen(),
                              );
                            },
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    GroupCard(),
                    const SizedBox(height: 16),
                    GroupCard(),
                    const SizedBox(height: 16),
                    GroupCard(),
                    const SizedBox(height: 16),
                    GroupCard(),
                    const SizedBox(height: 16),
                    GroupCard(),

                    const SizedBox(height: 24), // bottom padding for scroll
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
