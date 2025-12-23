import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:abc_app/core/constant/color_constant.dart';
import 'package:abc_app/core/components/text_style.dart';

class UploadCard extends StatefulWidget {
  final ValueChanged<XFile?>? onPicked;

  const UploadCard({super.key, this.onPicked});

  @override
  State<UploadCard> createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selected;

  Future<void> _pickImage() async {
    // pick from gallery (simple)
    final file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85, // compress
      maxWidth: 2000,
    );

    if (!mounted) return;

    setState(() => _selected = file);
    widget.onPicked?.call(file);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 147,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD1D5DC), width: 1.53),
        ),
        child: _selected == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    size: 28,
                    color: ColorConstant.darkgrey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Click to upload',
                    style: primaryTextStyle(
                      size: 14,
                      weight: FontWeight.w400,
                      color: ColorConstant.grey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'PNG, JPG up to 5MB',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.lightgrey,
                    ),
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(_selected!.path),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
      ),
    );
  }
}
