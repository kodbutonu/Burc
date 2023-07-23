import 'package:burc/core/extensions/context_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/sign.dart';
import '../../widgets/elevatedbutton.dart';
import '../../widgets/email.dart';
import '../../widgets/textfield.dart';

class LoginPageComponent extends StatefulWidget {
  const LoginPageComponent({Key? key}) : super(key: key);

  @override
  _LoginPageComponentState createState() => _LoginPageComponentState();
}

class _LoginPageComponentState extends State<LoginPageComponent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = userCredential.user;

      // Kullanıcı kaydı başarılı, işlemlere devam edebilirsiniz.
      // Kullanıcı adı ve ad bilgilerini Firebase'e kaydetmek için aşağıdaki adımları izleyebilirsiniz:
      if (user != null) {
        // Kullanıcı adını Firestore veritabanına kaydetmek için gerekli kodlar
        String username = _usernameController.text.trim();
        String email = user.email ?? '';

        await FirebaseFirestore.instance
            .collection('users') // Kullanıcılar koleksiyonu
            .doc(user.uid) // Kullanıcının UID'si ile belge oluştur
            .set({
          'username': username,
          'email': email,
        }); // 'username' alanına kullanıcı adını ve 'email' alanına kullanıcının e-postasını kaydet
      }

      Get.to(SignPage());
    } catch (e) {
      print('Kayıt işlemi başarısız: $e');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldd(
              text: 'Kullanıcı Adı Girin',
              width: Get.width * 0.1,
              color: Colors.black,
              controller: _usernameController,
            ),
            TextFieldd(
              controller: _nameController,
              color: Colors.black,
              text: 'Ad',
              width: Get.width * 0.1,
            ),
            EmailField(
              controller: _emailController,
              text: 'Email',
              width: Get.width * 0.1,
              color: Colors.black,
            ),
            TextFieldd(
              controller: _passwordController,
              text: 'Parola',
              width: Get.width * 0.1,
              color: Colors.black,
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            ZodiaButton(
              onPressed: register,
              text: 'Kayıt Ol', width1: Get.width*0.3,
            ),
          ],
        ),
      ),
    );
  }
}

