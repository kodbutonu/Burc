
import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pages/dan%C4%B1san_chat.dart';
import 'package:flutter/material.dart';

import '../pagecomponent/reklam/reklam_buttons.dart';
import '../pagecomponent/reklam/reklam_header.dart';

class Reklam extends StatefulWidget {
  int deger1;
   Reklam({Key? key,required this.deger1}) : super(key: key);

  @override
  State<Reklam> createState() => _ReklamState();
}

class _ReklamState extends State<Reklam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/SkyNight(3).png'),
    fit: BoxFit.cover,
    ),
    ),

        child: ListView(
          children: [
            SizedBox(height: context.veryhigh2Value,),
            ReklamHeader(),
            GestureDetector(onTap: (){
              ChatScreen(deger:widget.deger1);
            },
                child: ReklamButton())
          ],
        ),)

    );
  }
}
