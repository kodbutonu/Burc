import 'package:burc/core/extensions/context_extensions.dart';
import 'package:burc/pages/chat_History.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/burc_field.dart';
import 'burc_chat.dart';
import 'burc_harmony.dart';
import 'chat_room.dart';
import 'homepage.dart';
import 'horoscope_Page.dart';

class ZodiacSignsPage extends StatefulWidget {
  @override
  State<ZodiacSignsPage> createState() => _ZodiacSignsPageState();
}

class _ZodiacSignsPageState extends State<ZodiacSignsPage> {
  final List<String> zodiacSigns = [
    'yengec',
    'kova',
    'boga',
    'yay',
    'ikizler',
    'terazi',
    'basak',
    'balik',
    'oglak',
    'aslan',
    'akrep',
    'koc',
    // Add other zodiac signs...
  ];

  final List<String> zodiacDates = [
    '21 Haziran - 22 Temmuz',
    '21 Ocak - 19 Şubat',
    '20 Nisan - 20 Mayıs',
    '23 Kasım - 21 Aralık',
    '21 Mayıs - 20 Haziran',
    '23 Eylül - 22 Ekim',
    '23 Ağustos - 22 Eylül',
    '19 Şubat - 20 Mart',
    '22 Aralık - 19 Ocak',
    '23 Temmuz - 22 Ağustos',
    '23 Ekim - 21 Kasım',
    '21 Mart - 20 Nisan',
    // Add dates for other zodiac signs...
  ];

  int _selectedIndex = 0;
  String username = '';


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
    child: ListView.builder(
    itemCount: zodiacSigns.length,
    itemBuilder: (context, index) {
    return ListTile(
    title: BurcField(
    text: zodiacSigns[index],
    bodyText: 'Tarihler: ${zodiacDates[index]}',
    imageText: 'assets/images/${zodiacSigns[index]}.png',
    ),
      tileColor: Colors.white.withOpacity(0.4),
      onTap: () {
        Get.to(() => HoroscopePage(sign: '${zodiacSigns[index]}'));
      },
    );
    },
    ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    AssetImage('assets/images/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.email ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
// Profil sayfasına yönlendirme yapılabilir
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
// Ayarlar sayfasına yönlendirme yapılabilir
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Çıkış'),
              onTap: () {
// Çıkış işlemi gerçekleştirilebilir
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                  Get.to(BurcYorumlariApp());
                });
              },
            ),
            SizedBox(width: 50), // Boşluk için kullanılan SizedBox
            IconButton(
              icon: Icon(Icons.groups),
              color: _selectedIndex == 2 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                  Get.to(BurcComment());
// Ayarlar seçildiğinde yapılacak işlemler
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              color: _selectedIndex == 3 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
// Bildirimler seçildiğinde yapılacak işlemler
                Get.to(ChatHistoryScreen());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}