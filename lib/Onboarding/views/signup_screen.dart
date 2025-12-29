import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_button.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/custom_textfield.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/onboarding/provider/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                          const SizedBox(height: 16),
                          Text(
                            'Create Account',
                            style: arimoTextStyle(
                              color: Colors.white,
                              size: 30,
                              weight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Join AttendFlow today',
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
                      top: 28,
                      right: 24,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Profile Picture (Optional)',
                              style: arimoTextStyle(
                                color: ColorConstant.darkgrey,
                                size: 14,
                                weight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(child: Image.asset('assets/images/Label.png')),

                          // Full Name
                          const SizedBox(height: 16),
                          Text(
                            'Full Name',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            controller: _fullNameController,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                ? 'Please enter your full name'
                                : null,
                            hint: Text(
                              'John Smith',
                              style: arimoTextStyle(
                                size: 18,
                                weight: FontWeight.w400,
                                color: ColorConstant.grey,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: ColorConstant.lightgrey,
                            ),
                          ),

                          // Email
                          const SizedBox(height: 14),
                          Text(
                            'Email Address',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            controller: _emailController,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                ? 'Please enter email'
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

                          // Password
                          const SizedBox(height: 14),
                          Text(
                            'Password',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password should be at least 6 characters';
                              }
                              return null;
                            },
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
                            suffix: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: ColorConstant.lightgrey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),

                          // Confirm Password
                          const SizedBox(height: 14),
                          Text(
                            'Confirm Password',
                            style: arimoTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextfield(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
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
                            suffix: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: ColorConstant.lightgrey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 40),
                          CustomButton(
                            text: auth.isLoading
                                ? 'Creating...'
                                : 'Create Account',
                            width: double.infinity,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // auth logic
                                auth.signup(
                                  fullName: _fullNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );
                                // If later you save name as well, you can pass it into UserProvider
                              }
                            },
                          ),

                          const SizedBox(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: arimoTextStyle(
                                  size: 16,
                                  color: ColorConstant.darkgrey,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  " Sign In",
                                  style: arimoTextStyle(
                                    size: 16,
                                    color: ColorConstant.blue,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
