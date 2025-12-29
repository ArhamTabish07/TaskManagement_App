import 'package:flutter/material.dart';
import 'package:task_management_app/core/components/Header_card.dart';
import 'package:task_management_app/core/components/custom_button.dart';
import 'package:task_management_app/core/components/custom_description_field.dart';
import 'package:task_management_app/core/components/custom_icon_container.dart';
import 'package:task_management_app/core/components/custom_textfield.dart';
import 'package:task_management_app/core/components/text_style.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/service/navigation_service.dart';
import 'package:task_management_app/nav_bar/Home/Group/widgets/upload_image_card.dart';

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    HeaderCard(height: 212), // ✅ normal height (NOT 1870)
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
                            width: 50,
                            height: 50,
                            borderRadius: 100,
                            icon: IconButton(
                              onPressed: () => NavigationService().pop(),
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Create Group',
                            style: primaryTextStyle(
                              color: Colors.white,
                              size: 24,
                              weight: FontWeight.w500,
                            ),
                          ),
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

                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, right: 24),
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
                        const SizedBox(height: 8),
                        UploadCard(
                          onPicked: (file) {
                            if (file != null) {
                              print("Picked: ${file.path}");
                            }
                          },
                        ),

                        const SizedBox(height: 20),
                        Text(
                          'Group Name',
                          style: primaryTextStyle(
                            color: ColorConstant.darkgrey,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
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

                        const SizedBox(height: 20),
                        Text(
                          'Description',
                          style: primaryTextStyle(
                            color: ColorConstant.darkgrey,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
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

                        const SizedBox(height: 20),
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
                            padding: const EdgeInsets.only(top: 17, left: 17),
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
                                const SizedBox(height: 5),
                                Text(
                                  "•  You'll be set as group owner",
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

                        const SizedBox(height: 35),
                        CustomButton(
                          text: 'Create Group',
                          width: double.infinity,
                          onTap: () {},
                        ),
                        const SizedBox(height: 12),
                        CustomButton(
                          bordercolor: ColorConstant.black.withValues(
                            alpha: 0.1,
                          ),
                          borderwidth: 0.77,
                          buttoncolor: Colors.white,
                          textcolor: ColorConstant.black,
                          text: 'Cancel',
                          width: double.infinity,
                          onTap: () => NavigationService().pop(),
                        ),

                        const SizedBox(height: 33),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
