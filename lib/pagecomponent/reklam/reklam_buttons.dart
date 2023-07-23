import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';

class ReklamButton extends StatefulWidget {
  ReklamButton({Key? key}) : super(key: key);

  @override
  State<ReklamButton> createState() => _ReklamButtonState();
}

class _ReklamButtonState extends State<ReklamButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: context.highValue, top: context.high2Value),
      child: Column(
        children: [
          Text(
            "Reklam izleyerek yorum hakkı kazanabilirsin.",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height:context.highValue,),
          Row(children: [  ZodiaButton(
            text: "Reklam İzle Yorum Hakkı Kazan",
            onPressed: () {},
            width1: context.extremeValue,
          )],)
        ],
      ),
    );
  }
}
