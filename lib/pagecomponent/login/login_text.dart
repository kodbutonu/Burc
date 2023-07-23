import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/user_controller.dart';
import '../../widgets/login_header.dart';
import '../../widgets/login_title.dart';

class LoginTextComponent extends StatelessWidget {


   LoginTextComponent({Key? key}) : super(key: key);
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.lowValue,
      ),
      child: Column(
        children: [
           LoginHeader(text: '${userController.zodiacSign.value}'),
          SizedBox(
            height: context.lowValue,
          ),
          LoginTitle(
            text: 'Şimdi ise son bilgileri girerek aramıza katıl.',
          ),
        ],
      ),
    );
  }
}