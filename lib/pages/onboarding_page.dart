import 'package:burc/core/extensions/context_extensions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pagecomponent/onboardıng.dart/textfieldreplace.dart';
import '../pagecomponent/onboardıng.dart/texttitle.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: Get.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: context.mediumValue, left: context.mediumValue),
            child: Column(
              children: [TextTileHeader(), TextFieldReplace()],
            ),
          ),
        ],
      ),
    );
  }
}
