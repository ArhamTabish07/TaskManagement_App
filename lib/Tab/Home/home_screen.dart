import 'package:abc_app/Onboarding/provider/user_provider.dart';
import 'package:abc_app/Tab/Home/Group/create_group_screen.dart';
import 'package:abc_app/Tab/Home/core/constant/IconConstant.dart';
import 'package:abc_app/Tab/Home/core/extension/extension.dart';
import 'package:abc_app/Tab/Home/widgets/group_card.dart';
import 'package:abc_app/components/bottom_nav_bar.dart';
import 'package:abc_app/components/custom_info_container.dart';
import 'package:abc_app/Tab/Home/core/constant/ColorConstant.dart';
import 'package:abc_app/components/custom_auth_card.dart';
import 'package:abc_app/components/custom_icon_container.dart';
import 'package:abc_app/components/text_style.dart';
import 'package:abc_app/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProv = context.watch<UserProvider>();
    final user = userProv.currentUser;

    if (userProv.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CustomCard(height: 212),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome Back',
                                style: primaryTextStyle(
                                  color: Colors.white,
                                  size: 14,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                user.name.isEmpty ? 'Guest User' : user.name,
                                style: primaryTextStyle(
                                  size: 24,
                                  weight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          CustomiconContainer(
                            // ContainerColor: ColorConstant.iconcontainerwhite,
                            width: 48,
                            height: 48,
                            borderRadius: 100,
                            icon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                IconConstants.bell,
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      Row(
                        children: [
                          CustomInfoContainer(
                            ContainerColor: ColorConstant.iconcontainerwhite,

                            borderRadius: 16,
                            title: Text(
                              '2',
                              style: primaryTextStyle(
                                size: 24,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Groups',
                              style: primaryTextStyle(
                                size: 12,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),

                          CustomInfoContainer(
                            ContainerColor: ColorConstant.iconcontainerwhite,

                            borderRadius: 16,
                            title: Text(
                              '22',
                              style: primaryTextStyle(
                                size: 24,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Present',
                              style: primaryTextStyle(
                                size: 12,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          CustomInfoContainer(
                            ContainerColor: ColorConstant.iconcontainerwhite,

                            borderRadius: 16,
                            title: Text(
                              '8',
                              style: primaryTextStyle(
                                size: 24,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Tasks',
                              style: primaryTextStyle(
                                size: 12,
                                weight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  top: 24,
                  right: 24,
                  // bottom: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('My Groups', style: primaryTextStyle(size: 20)),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            gradient: LinearGradient(
                              colors: [Color(0xff155DFC), Color(0xff9810FA)],
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              NavigationService().navigateToScreen(
                                nextScreen: CreateGroupScreen(),
                              );
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    GroupCard(),
                    SizedBox(height: 16),
                    GroupCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
