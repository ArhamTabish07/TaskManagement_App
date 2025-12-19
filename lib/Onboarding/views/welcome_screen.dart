import 'package:abc_app/constant/colors.dart';
import 'package:abc_app/components/custom_button.dart';
import 'package:abc_app/components/custom_container.dart';
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
      // extendBodyBehindAppBar: true,
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
                  CustomContainer(
                    ContainerColor: ColorConstant.containerwhite,
                    height: 95,
                    width: 95,
                    borderRadius: 24,
                    image: Image.asset('assets/icons/Icon.png'),
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
                          CustomContainer(
                            ContainerColor: ColorConstant.containerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            image: Image.asset('assets/icons/Icon (1).png'),
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
                          CustomContainer(
                            ContainerColor: ColorConstant.containerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            image: Image.asset('assets/icons/Icon (2).png'),
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
                          CustomContainer(
                            ContainerColor: ColorConstant.containerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            image: Image.asset('assets/icons/Icon (3).png'),
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

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     CustomContainer(
                  //       width: 64,
                  //       height: 64,
                  //       borderRadius: 16,
                  //       image: Image.asset('assets/icons/Icon (1).png'),
                  //     ),
                  //     CustomContainer(
                  //       width: 64,
                  //       height: 64,
                  //       borderRadius: 16,
                  //       image: Image.asset('assets/icons/Icon (2).png'),
                  //     ),
                  //     CustomContainer(
                  //       width: 64,
                  //       height: 64,
                  //       borderRadius: 16,
                  //       image: Image.asset('assets/icons/Icon (3).png'),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       'Attendance',
                  //       style: primaryTextStyle(
                  //         color: Color(0xffDBEAFE),
                  //         weight: FontWeight.w400,
                  //         size: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Tasks',
                  //       style: primaryTextStyle(
                  //         color: Color(0xffDBEAFE),
                  //         weight: FontWeight.w400,
                  //         size: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Teams',
                  //       style: primaryTextStyle(
                  //         color: Color(0xffDBEAFE),
                  //         weight: FontWeight.w400,
                  //         size: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //         'assets/images/Attendance and Task Management App.png',
      //       ),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Stack(
      //     children: [
      //       Column(children: [Container(height: 100, width: 100)]),
      //     ],
      //   ),
      // ),
    );
  }
}
