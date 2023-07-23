
import 'package:burc/pages/login.dart';
import 'package:burc/pages/onboarding_page.dart';
import 'package:burc/pages/reklam.dart';
import 'package:burc/pages/sign.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/datecontroller..dart';
import 'controller/user_controller.dart';

 main() async {
   Get.put(UserController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

   MyApp({Key? key});

  final DateController dateController = Get.put(DateController());
  final UserController userController = Get.put(UserController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 150.0,
            fontFamily: 'Hind',
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w300,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Hind',
            color:Colors.black
          ),
          headline3: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
            color: Colors.black54,
          ),
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'Hind',
          ),
          headline6: TextStyle(
            fontSize: 36.0,
            color: Colors.white,
            fontFamily: 'Hind',
          ),
          headline5: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            fontFamily: 'Hind',
          ) ,
          bodyText2: TextStyle(
            fontSize: 12.0,
            fontFamily: 'Hind',
            color: Colors.white70,
            fontWeight: FontWeight.w300,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 33, 33, 33)),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            disabledBackgroundColor: Colors.red,
            shadowColor: Colors.green,
            side: BorderSide(color: Colors.grey),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(git che
            primary: Colors.purple ,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home:OnBoardingPage()

    );
  }
}