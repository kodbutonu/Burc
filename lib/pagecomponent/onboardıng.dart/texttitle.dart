import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/widgets/sign_title.text.dart';
import 'package:burc/widgets/text.dart';
import 'package:flutter/material.dart';

class TextTileHeader extends StatelessWidget {
  const TextTileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: context.veryhighValue,
         ),
      child: Column(
        children: [
          SignHeader(text: "Bize katılın ve yıldızlara kapı açalım."),
          SizedBox(
            height: context.lowValue,
          ),
          SignTitle(
            text:
                'Uygulamaya başlamak için sadece doğum tarihini gir ve uygulamamıza başla.',
          )
        ],
      ),
    );
  }
}
