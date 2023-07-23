import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldd extends StatelessWidget {
  TextFieldd({
    Key? key,
    required this.text,
    required this.width,
    required this.color,
    this.controller,
  }) : super(key: key);

  final String text;
  final double width;
  final Color color;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * width,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: color,
        ),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusColor: color,
          filled: true,
          fillColor: Colors.transparent,
          labelText: text,
          labelStyle: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ),
    );
  }}