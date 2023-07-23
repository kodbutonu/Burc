import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        margin: EdgeInsets.only(top: context.morehighvalue,left: context.morehighvalue),
        width: Get.width * 0.250,
        height: Get.height * 0.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.extremeValue),
          color: Colors.grey, // Default color
          image: _selectedImage != null
              ? DecorationImage(
                  image: FileImage(_selectedImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _selectedImage == null
            ? Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 40.0,
              )
            : null,
      ),
    );
  }
}
