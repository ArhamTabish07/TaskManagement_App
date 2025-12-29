import 'package:flutter/material.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/custom_textfield.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/nav_bar/Home/widgets/group_card.dart';
import 'package:task_management_app/nav_bar/Subscription/widgets/subscription_tab.dart';

// <-- if your AppSegmentedTab file name differs, change it

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int selectedIndex = 0; // 0 = Group Chats, 1 = Direct

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
                                icon: const Icon(
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

                        // ✅ segmented tab
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
                    AppSegmentedTab(
                      selectedIndex: selectedIndex,
                      onChanged: (i) => setState(() => selectedIndex = i),
                      items: const [
                        AppSegmentedTabItem(
                          label: 'Group Chats',
                          icon: Icon(Icons.group),
                        ),
                        AppSegmentedTabItem(
                          label: 'Direct',
                          icon: Icon(Icons.chat_bubble_outline),
                        ),
                      ],

                      // container look
                      height: 56,
                      borderRadius: 14,
                      backgroundColor: Colors.white, // outer container bg
                      borderColor: const Color(0xFFE5E7EB),

                      // selected = gradient
                      selectedGradient: const LinearGradient(
                        colors: [Color(0xFF155DFC), Color(0xFF9810FA)],
                      ),
                      selectedColor: null,
                      selectedTextColor: Colors.white,
                      selectedIconColor: Colors.white,

                      // unselected = WHITE background (like your design)
                      unselectedItemColor: Colors.white,
                      unselectedTextColor: const Color(0xFF6B7280),
                      unselectedIconColor: const Color(0xFF6B7280),
                    ),
                    const SizedBox(height: 24),

                    // ✅ change content based on tab
                    if (selectedIndex == 0) ...[
                      GroupCard(),
                      const SizedBox(height: 16),
                      GroupCard(),
                      const SizedBox(height: 16),
                      GroupCard(),
                    ] else ...[
                      // Direct chats list (replace with your widget)
                      GroupCard(),
                      const SizedBox(height: 16),
                      GroupCard(),
                    ],

                    const SizedBox(height: 24),
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
