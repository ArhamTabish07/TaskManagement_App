import 'package:abc_app/Tab/Home/core/constant/ColorConstant.dart';
import 'package:abc_app/components/custom_button.dart';
import 'package:abc_app/components/custom_icon_container.dart';
import 'package:abc_app/components/text_style.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Attendance and Task Management App.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 176.0),
              child: Column(
                children: [
                  CustomiconContainer(
                    // ContainerColor: ColorConstant.iconcontainerwhite,
                    height: 95,
                    width: 95,
                    borderRadius: 24,
                    icon: Image.asset('assets/icons/Icon.png'),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'AttendFlow',
                    style: primaryTextStyle(
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 36,
                    ),
                  ),
                  SizedBox(height: 11),
                  Text(
                    'Track attendance, manage tasks,\nand collaborate with your team',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(
                      color: Colors.white,
                      weight: FontWeight.w400,
                      size: 16,
                    ),
                  ),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CustomiconContainer(
                            // ContainerColor: ColorConstant.iconcontainerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            icon: Image.asset('assets/icons/Icon (1).png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Attendance',
                            style: primaryTextStyle(
                              color: Color(0xffDBEAFE),
                              weight: FontWeight.w400,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomiconContainer(
                            // ContainerColor: ColorConstant.iconcontainerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            icon: Image.asset('assets/icons/Icon (2).png'),
                          ),
                          Text(
                            'Tasks',
                            style: primaryTextStyle(
                              color: Color(0xffDBEAFE),
                              weight: FontWeight.w400,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomiconContainer(
                            // ContainerColor: ColorConstant.iconcontainerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            icon: Image.asset('assets/icons/Icon (3).png'),
                          ),
                          Text(
                            'Teams',
                            style: primaryTextStyle(
                              color: Color(0xffDBEAFE),
                              weight: FontWeight.w400,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 224),
                  CustomButton(
                    buttoncolor: Colors.white,
                    text: 'Get Started',
                    textcolor: Color(0xff155DFC),
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Join thousands of teams worldwide',
                    style: primaryTextStyle(
                      weight: FontWeight.w400,
                      size: 14,
                      color: Color(0xffDBEAFE),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
