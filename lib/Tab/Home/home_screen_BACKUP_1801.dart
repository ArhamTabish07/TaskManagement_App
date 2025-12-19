import 'package:abc_app/Onboarding/provider/user_provider.dart';
import 'package:abc_app/Tab/Home/widgets/group_card.dart';
import 'package:abc_app/components/bottom_nav_bar.dart';
import 'package:abc_app/constant/colors.dart';
import 'package:abc_app/constant/icons.dart';
import 'package:abc_app/components/custom_auth_card.dart';
import 'package:abc_app/components/custom_container.dart';
import 'package:abc_app/components/text_style.dart';
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

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomCard(height: 212),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    // SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                        CustomContainer(
                          ContainerColor: ColorConstant.containerwhite,
                          width: 48,
                          height: 48,
                          borderRadius: 100,
                          image: Image.asset(IconConstants.bell),
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    Row(
                      children: [
                        CustomContainer(
                          ContainerColor: ColorConstant.containerwhite,
                          width: 110,
                          height: 76,
                          borderRadius: 16,
                          text1: Text(
                            '2',
                            style: primaryTextStyle(
                              size: 24,
                              weight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          text2: Text(
                            'Groups',
                            style: primaryTextStyle(
                              size: 12,
                              weight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        CustomContainer(
                          ContainerColor: ColorConstant.containerwhite,
                          width: 110,
                          height: 76,
                          borderRadius: 16,
                          text1: Text(
                            '22',
                            style: primaryTextStyle(
                              size: 24,
                              weight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          text2: Text(
                            'Present',
                            style: primaryTextStyle(
                              size: 12,
                              weight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        CustomContainer(
                          ContainerColor: ColorConstant.containerwhite,
                          width: 110,
                          height: 76,
                          borderRadius: 16,
                          text1: Text(
                            '8',
                            style: primaryTextStyle(
                              size: 24,
                              weight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          text2: Text(
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
                          onPressed: () {},
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
    );
  }
}
