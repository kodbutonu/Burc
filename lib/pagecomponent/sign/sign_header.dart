import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../widgets/login_header.dart';
import '../../widgets/login_title.dart';

class SignHeaderr extends StatelessWidget {


  const SignHeaderr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.lowValue,
        right: context.highValue
      ),
      child: Center(
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(right: context.high2Value),
                child: LoginHeader(text:"Hoşgeldin!")),
            SizedBox(
              height: context.lowValue,
            ),
            LoginTitle(
              text: 'Lütfen aramıza katılmak için devam et',
            ),
          ],
        ),
      ),
    );
  }
}