import 'dart:io';
import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pagecomponent/login/login_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pagecomponent/login/login_image.dart';
import '../pagecomponent/login/login_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.png'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: context.highValue, right: context.highValue),
          child: Column(
            children: [
              CustomImagePicker(),
              LoginTextComponent(),
              LoginPageComponent()
            ],
          ),
        ),
      ],
    );
  }
}
