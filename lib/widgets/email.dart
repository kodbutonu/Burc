import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EmailField extends StatefulWidget {
  EmailField({
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
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late TextEditingController _textEditingController;
  String inputValue = '';
  bool showEmailError = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      inputValue = _textEditingController.text;
      showEmailError = !_isEmailValid(_textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(
              color: widget.color,
            ),
            controller: _textEditingController,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusColor: widget.color,
              filled: true,
              fillColor: Colors.transparent,
              labelText: widget.text,
              labelStyle: TextStyle(
                color: widget.color,
                fontSize: 12,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          if (showEmailError && inputValue.isNotEmpty)
            Text(
              'Geçerli bir email adresi girin',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }

  bool _isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }
}