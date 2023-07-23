import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pages/login.dart';
import 'package:burc/widgets/sign_title.text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/date.dart';
import '../../widgets/texfieldlogin.dart';

class TextFieldReplace extends StatelessWidget {
  const TextFieldReplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(
          top: context.highValue,
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.highValue,
            ),
            Date(
              color: Colors.white,
              text: 'Doğum Tarihi',
              width: Get.width * 0.3,
            ),
            TextFielddd(
              color: Colors.white,
              text: 'Doğum Yeri',
              width: Get.width * 0.1,
            ),
            SizedBox(
              height: context.highValue,
            ),
            Container(
              margin: EdgeInsets.only(right: context.highValue),
              child: GestureDetector(
                child: Row(
                  children: [
                    SignTitle(text: 'Hesabım var.'),
                    IconButton(
                        onPressed: () {
                         Get.to(LoginPage());
                        },
                        icon: Icon(Icons.chevron_right))
                  ],
                ),
                onTap: () {
                  Get.to(LoginPage());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
