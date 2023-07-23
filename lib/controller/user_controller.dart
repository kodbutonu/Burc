import 'package:get/get.dart';

class UserController extends GetxController {
  RxString zodiacSign = RxString('');

  void updateZodiacSign(String sign) {
    zodiacSign.value = sign;
  }
}