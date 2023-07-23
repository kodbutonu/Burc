import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {

  ChatRoomPage();

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  @override
  String username = ''; // Kullanıcı adını tutacak değişkeni tanımladık

  @override
  void initState() {
    super.initState();
    // Firestore'dan kullanıcı adını çekmek için gerekli kod
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          setState(() {
            var snapshotData = snapshot.data() as Map<String, dynamic>;
            username = snapshotData['username'] ?? '';
          });
        }
      }
    } catch (e) {
      print('Kullanıcı adı alınamadı: $e');
    }
  }
  List<String> messages = [];

  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      String messageWithUsername = '$username: $message';
      messages.add(messageWithUsername);
      messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.star),
            SizedBox(width: 10),
            Text(
              'İkizler Sohbet Odası',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF5D38FF),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    messages[index],
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            color: Color(0xFFEDE7F6),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Mesajınızı girin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

