import 'package:flutter/material.dart';

class UnderlineTitle extends StatelessWidget {
  UnderlineTitle({Key? key, required this.text,required this.color}) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
          decoration: TextDecoration.underline,
          color: color// Alt çizgiyi ekliyoruz
        ),
      ),
    );
  }
}