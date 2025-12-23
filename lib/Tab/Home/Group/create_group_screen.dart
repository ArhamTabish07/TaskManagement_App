import 'package:abc_app/Onboarding/provider/authentication_provider.dart';
import 'package:abc_app/Tab/Home/Group/widgets/upload_image_card.dart';
import 'package:abc_app/components/custom_description_field.dart';
import 'package:abc_app/Tab/Home/core/constant/ColorConstant.dart';
import 'package:abc_app/components/custom_auth_card.dart';
import 'package:abc_app/components/custom_button.dart';
import 'package:abc_app/components/custom_icon_container.dart';
import 'package:abc_app/components/custom_textfield.dart';
import 'package:abc_app/components/text_style.dart';
import 'package:abc_app/service/navigation_service.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _form = GlobalKey<FormState>();
  final _groupname = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    _groupname.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  CustomCard(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      right: 24,
                      left: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomiconContainer(
                          // ContainerColor: ColorConstant.iconcontainerwhite,
                          width: 50,
                          height: 50,
                          borderRadius: 100,
                          icon: IconButton(
                            onPressed: () {
                              NavigationService().pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Create Group',
                          style: primaryTextStyle(
                            color: Colors.white,
                            size: 24,
                            weight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(height: 12),
                        Text(
                          'Set up your team workspace',
                          style: primaryTextStyle(
                            color: Colors.white,
                            size: 16,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
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
                            'Group Image',
                            style: primaryTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          UploadCard(
                            onPicked: (file) {
                              if (file != null) {
                                // upload / save / show path
                                print("Picked: ${file.path}");
                              }
                            },
                          ),

                          SizedBox(height: 20),
                          Text(
                            'Group Name',
                            style: primaryTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomTextfield(
                            validator: (value) => value == null || value.isEmpty
                                ? 'Please enter Group Name'
                                : null,
                            controller: _groupname,
                            hint: Text(
                              'e.g. ABC Company',
                              style: primaryTextStyle(
                                size: 16,
                                weight: FontWeight.w400,
                                color: ColorConstant.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Group Name',
                            style: primaryTextStyle(
                              color: ColorConstant.darkgrey,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          CustomDescriptionField(
                            hint: Text(
                              'Brief description of your group...',
                              style: primaryTextStyle(
                                size: 16,
                                weight: FontWeight.w400,
                                color: ColorConstant.grey,
                              ),
                            ),
                            controller: _description,
                            validator: (v) => (v == null || v.trim().isEmpty)
                                ? 'Please enter description'
                                : null,
                            maxLines: 2,
                            minLines: 2,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              color: ColorConstant.containerblue,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ColorConstant.lightblue,
                                width: 0.77,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 17.0,
                                left: 17,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What happens next?',
                                    style: primaryTextStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: ColorConstant.darkblue,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "•  You'll be set as grup owner",
                                    style: primaryTextStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: ColorConstant.blue,
                                    ),
                                  ),
                                  Text(
                                    '•  Invite members from group settings',
                                    style: primaryTextStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: ColorConstant.blue,
                                    ),
                                  ),
                                  Text(
                                    '•  Assign roles and manage attendance',
                                    style: primaryTextStyle(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: ColorConstant.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 35),

                          CustomButton(
                            text: 'Sign In',
                            width: double.infinity,
                            onTap: () {},
                          ),
                          SizedBox(height: 12),

                          CustomButton(
                            bordercolor: ColorConstant.black.withValues(
                              alpha: 0.1,
                            ),
                            borderwidth: 0.77,
                            buttoncolor: Colors.white,
                            textcolor: ColorConstant.black,
                            text: 'Cancel',
                            width: double.infinity,
                            onTap: () {},
                          ),

                          // Spacer(),
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
