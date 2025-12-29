import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_button.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/custom_textfield.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/service/navigation_service.dart';
import 'package:task_management_app/onboarding/provider/auth_provider.dart';
import 'package:task_management_app/onboarding/views/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();

    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  HeaderCard(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Center(
                      child: Column(
                        children: [
                          CustomiconContainer(
                            // ContainerColor: ColorConstant.iconcontainerwhite,
                            width: 64,
                            height: 64,
                            borderRadius: 16,
                            icon: Image.asset('assets/icons/logo.png'),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Sign in to continue',
                            style: arimoTextStyle(
                              color: Colors.white,
                              size: 16,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 32,
                      right: 24,
                      // bottom: 32,
                    ),
                    child: Form(
                      key: _form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email Address',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextfield(
                            controller: _email,
                            validator: (value) => value == null || value.isEmpty
                                ? 'Please enter Email'
                                : null,
                            hint: Text(
                              'john.smith@company.com',
                              style: arimoTextStyle(
                                size: 18,
                                weight: FontWeight.w400,
                                color: ColorConstant.grey,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: ColorConstant.lightgrey,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Password',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextfield(
                            validator: (value) => value == null || value.isEmpty
                                ? 'Please enter Password'
                                : null,
                            controller: _password,
                            obscureText: true,
                            hint: Text(
                              '••••••••',
                              style: arimoTextStyle(
                                size: 18,
                                weight: FontWeight.w400,
                                color: ColorConstant.grey,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: ColorConstant.lightgrey,
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: arimoTextStyle(
                                size: 14,
                                weight: FontWeight.w400,
                                color: ColorConstant.blue,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            text: 'Sign In',
                            width: double.infinity,
                            onTap: () {
                              if (_form.currentState!.validate()) {
                                auth.login(_email.text.trim(), _password.text);
                              }
                            },
                          ),
                          // Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: arimoTextStyle(
                                  size: 16,
                                  color: ColorConstant.darkgrey,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  NavigationService().navigateToScreen(
                                    nextScreen: SignupScreen(),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: arimoTextStyle(
                                    size: 16,
                                    color: ColorConstant.blue,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 33),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
