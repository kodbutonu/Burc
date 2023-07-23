import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  LoginTitle({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
