import 'package:flutter/material.dart';
class SignHeader extends StatelessWidget {
  SignHeader({Key? key,required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
