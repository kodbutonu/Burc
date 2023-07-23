import 'package:burc/widgets/burc_field.dart';
import 'package:flutter/material.dart';

import '../pagecomponent/burc_chat/burc_comment.dart';

class BurcComment extends StatelessWidget {
  const BurcComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Zodiac Signs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bakground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [BurcComm()],
          ),
        ));
  }
}
