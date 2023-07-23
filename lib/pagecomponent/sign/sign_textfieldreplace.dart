import 'package:burc/core/extensions/context_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/homepage.dart';
import '../../pages/sign.dart';
import '../../widgets/elevatedbutton.dart';
import '../../widgets/email.dart';
import '../../widgets/textfield.dart';

class SignPageField extends StatefulWidget {
  const SignPageField({Key? key}) : super(key: key);

  @override
  _SignPageFieldState createState() => _SignPageFieldState();
}

class _SignPageFieldState extends State<SignPageField> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        User? user = userCredential.user;
        if (user != null) {
          Get.to(HomePage(
              email: _emailController.text,
              password: _passwordController.text));
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to log in. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Giriş Başarısız.Kullanıcı adı veya şifre yanlış.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(
          top: context.lowValue,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EmailField(
                controller: _emailController,
                text: 'Email',
                width: Get.width * 0.1,
                color: Colors.black,
              ),
              TextFieldd(
                controller: _passwordController,
                text: 'Password',
                width: Get.width * 0.1,
                color: Colors.black,
              ),
              SizedBox(
                height: context.mediumValue,
              ),
              ZodiaButton(

                onPressed: login,
                text: 'Giriş Yap', width1: Get.width*0.3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
