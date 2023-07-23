import 'package:burc/pages/aladdin.chat.dart';
import 'package:burc/pages/medium_chat.dart';
import 'package:burc/pages/zodiac_signs_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

Future<List<String>> fetchHoroscope(String sign, String period) async {
  var url = Uri.parse(
      'https://www.hurriyet.com.tr/mahmure/astroloji/$sign-burcu-$period-yorum/');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var body = response.body;
    return find('<p>', '</p>', body);
  } else {
    throw Exception('API isteği başarısız oldu: ${response.statusCode}');
  }
}

List<String> find(String first, String last, String text) {
  var matches = RegExp('$first(.*?)$last').allMatches(text);
  return matches.map((match) => match.group(1)!).toList();
}

class HomePage extends StatelessWidget {
  final String email;
  final String password;

  HomePage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserCredential>(
      future: FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Giriş işlemi tamamlanana kadar bekleme ekranı göster
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Giriş işlemi hatalıysa hata mesajı göster
          return Scaffold(
            body: Center(child: Text('Giriş yapılamadı: ${snapshot.error}')),
          );
        } else {
          // Giriş işlemi başarılı ise kullanıcı bilgilerini al
          User? user = snapshot.data?.user;
          String currentUserEmail = user?.email ?? '';

          // Eğer email ve şifre doğruysa medium_chat ekranına yönlendir
          if (currentUserEmail == 'ka13@yandex.com' &&
              password == 'Guluban.234') {
            return MediumChat();
          } else if (currentUserEmail == 'ka@yandex.com' &&
              password == 'Guluban.234') {
            // Değilse zodiac page sayfasına yönlendir
            return AladdinChat();
          } else {
            // Değilse zodiac page sayfasına yönlendir
            return ZodiacSignsPage();
          }
        }
      },
    );
  }
}
