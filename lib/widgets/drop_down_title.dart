import 'package:flutter/material.dart';

class DropDownTitle extends StatefulWidget {
  DropDownTitle({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<DropDownTitle> createState() => _DropDownTitleState();
}

class _DropDownTitleState extends State<DropDownTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,),
    );
  }
}
