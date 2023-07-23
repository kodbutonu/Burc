import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pagecomponent/sign/sign_textfieldreplace.dart';
import 'package:burc/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pagecomponent/sign/sign_header.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sign.png'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: context.veryhighValue,
              left: context.highValue,
              right: context.highValue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SignHeaderr(), SignPageField()],
          ),
        ),
      ],
    );
  }
}
