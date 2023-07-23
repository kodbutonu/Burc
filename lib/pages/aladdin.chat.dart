import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'message.dart';

class AladdinChat extends StatefulWidget {
  @override
  _AladdinChatState createState() => _AladdinChatState();
}

class _AladdinChatState extends State<AladdinChat> {
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('alaaddin');

  List<String> usernames = [];
  TextEditingController messageController = TextEditingController();

  String? currentUserEmail; // E-posta adresini tutacak değişken

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserEmail =
            user.email; // Giriş yapan kullanıcının e-posta adresini alıyoruz
      });
    }
    messagesCollection.get().then((snapshot) {
      setState(() {
        usernames = snapshot.docs
            .map<String>((doc) => doc['username'] as String? ?? '')
            .toSet()
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medyumla Sohbet'),
      ),
      body: ListView.builder(
        itemCount: usernames.length,
        itemBuilder: (context, index) {
          final user = usernames[index];
          return ListTile(
            title: Text(user),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(
                    currentUserEmail: currentUserEmail,
                    username: user,
                    deger: 1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
