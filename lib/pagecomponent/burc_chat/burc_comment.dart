import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pages/chat_room.dart';
import 'package:burc/pages/dan%C4%B1san_chat.dart';
import 'package:burc/widgets/burc_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../pages/reklam.dart';




class BurcComm extends StatelessWidget {
  const BurcComm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: context.mediumValue,right: context.mediumValue),
      child: Column(
        children: [
          SizedBox(
            height: context.veryhigh2Value,
          ),
          GestureDetector(onTap: (){
            Get.to(Reklam(deger1: 1,));
          },
            child: BurcField(
                text: "Burcu Abla ile Sohbet",
                bodyText: "Burcu Abla İle Burcun ve Geleceğin Hakkında Sohbet Et.",
                imageText: "assets/images/fortune-teller.png"),
          ),
          SizedBox(
            height: context.highValue,
          ),
          GestureDetector(
            onTap: (){
              Get.to(ChatRoomPage());
            },
            child: BurcField(
              text: 'Diğer İnsanlara Sohbet Et',
              imageText: "assets/images/chat.png",
              bodyText: 'Aynı Burçtan Olduğun Kişilerle Sohbete Katıl.',
            ),
          ),
          SizedBox(
            height: context.highValue,
          ),
          GestureDetector(
            onTap: (){
              Get.to(Reklam(deger1: 2,));
            },
            child: BurcField(
              text: 'Alaadinle Burç Sohbeti',
              imageText: "assets/images/fortune-teller-man.png",
              bodyText: 'Aladdinle Burç Uyumun ve Aşk Hayatın Hakkında Sohbet Et.',
            ),
          ),


        ],
      ),
    );
  }
}
