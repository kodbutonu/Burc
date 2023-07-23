import 'dart:io';

import 'package:get/get.dart';

class ZodiacSignsController extends GetxController {
  File? selectedImage;

  void setImage(File? image) {
    selectedImage = image;
    update();
  }
}
