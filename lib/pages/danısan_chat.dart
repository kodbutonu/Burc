import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'chat_History.dart';

class ChatScreen extends StatefulWidget {
  final int deger;

  const ChatScreen({required this.deger});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference alaaddinMessagesCollection =
      FirebaseFirestore.instance.collection('alaaddin');
  CollectionReference burcuablaMessagesCollection =
      FirebaseFirestore.instance.collection('burcuabla');

  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();

  String? currentUserEmail; // E-posta adresini tutacak değişken
  bool isCurrentUser = false;
  String username = '';

  void sendMessage(String message) async {
    if (widget.deger == 1) {
      await burcuablaMessagesCollection.add({
        'message': message,
        'isFromMedyum': false, // Mesajın danışandan geldiğini belirtiyoruz
        'email': currentUserEmail, // E-posta adresini kaydediyoruz
        'username': username, // Kullanıcı adını kaydediyoruz
        'timestamp': DateTime.now(),
      });
    } else if (widget.deger == 2) {
      await alaaddinMessagesCollection.add({
        'message': message,
        'isFromMedyum': false, // Mesajın danışandan geldiğini belirtiyoruz
        'email': currentUserEmail, // E-posta adresini kaydediyoruz
        'username': username, // Kullanıcı adını kaydediyoruz
        'timestamp': DateTime.now(),
      });
    }

    messageController.clear();
  }

  void sendReply(String message) async {
    if (widget.deger == 1) {
      await burcuablaMessagesCollection.add({
        'message': message,
        'isFromMedyum': true, // Mesajın medyumdan geldiğini belirtiyoruz
        'email': currentUserEmail, // E-posta adresini kaydediyoruz
        'username': 'Medyum', // Medyum kullanıcı adını kullanıyoruz
        'timestamp': DateTime.now(),
      });
    } else if (widget.deger == 2) {
      await alaaddinMessagesCollection.add({
        'message': message,
        'isFromMedyum': true, // Mesajın medyumdan geldiğini belirtiyoruz
        'email': currentUserEmail, // E-posta adresini kaydediyoruz
        'username': 'Medyum', // Medyum kullanıcı adını kullanıyoruz
        'timestamp': DateTime.now(),
      });
    }

    messageController.clear();
  }

  @override
  void initState() {
    fetchUsername();
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserEmail =
            user.email; // Giriş yapan kullanıcının e-posta adresini alıyoruz
      });
    }

    Stream<QuerySnapshot> messageStream;
    if (widget.deger == 1) {
      messageStream = burcuablaMessagesCollection
          .where('email', isEqualTo: currentUserEmail)
          .snapshots();
    } else {
      messageStream = alaaddinMessagesCollection
          .where('email', isEqualTo: currentUserEmail)
          .snapshots();
    }

    messageStream.listen((snapshot) {
      setState(() {
        messages = snapshot.docs
            .map<Map<String, dynamic>>(
                (doc) => doc.data() as Map<String, dynamic>? ?? {})
            .toList();
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SkyNight(2).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.veryhigh2Value,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isFromMedyum = message['isFromMedyum'] ?? false;
                  final senderEmail = message['email'] ?? '';
                  final text = message['message'] ?? '';
                  final timestamp = message['timestamp']
                      ?.toDate(); // Convert timestamp to DateTime

                  final formattedTimestamp = timestamp != null
                      ? DateFormat('HH:mm')
                          .format(timestamp) // Format timestamp as desired
                      : '';

                  isCurrentUser = (senderEmail == currentUserEmail);

                  return ListTile(
                    title: Container(
                      margin: EdgeInsets.only(right: 150),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: isCurrentUser
                            ? Colors.white
                            : Colors.grey[
                                200], // Set background color based on sender
                        borderRadius: BorderRadius.only(
                          topRight: isCurrentUser
                              ? Radius.circular(20.0)
                              : Radius.circular(50.0),
                          bottomRight: isCurrentUser
                              ? Radius.circular(20.0)
                              : Radius.circular(50.0),
                          topLeft: Radius.circular(
                              20.0), // Set border radius for the top-left corner
                          bottomLeft: Radius.circular(
                              20.0), // Set border radius for the bottom-left corner
                        ),
                      ),
                      child: Center(
                        child: Text(
                          isFromMedyum ? 'Medyum: $text' : '$username: $text',
                          style: TextStyle(
                            color: isCurrentUser
                                ? Colors.black
                                : Colors
                                    .black, // Set text color based on sender
                          ),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      formattedTimestamp,
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200],
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
                      if (messages.isNotEmpty &&
                          messages.last['isFromMedyum'] == true) {
                        sendReply(messageController.text);
                      } else {
                        sendMessage(messageController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // ChatScreen'den ChatHistoryScreen'e bilgi göndermek için Route kullanımı:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ChatHistoryScreen(onBack: (data) {
          //       // ChatHistoryScreen'den gelen data'yı burada kullanabilirsiniz.
          //       // Örneğin, data içinde chatHistory listesi olabilir.
          //     }),
          //   ),
          // );

          // Eğer bilgi göndermeyecekseniz sadece Navigator.push kullanın:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatHistoryScreen(messages: messages)),
          );
        },
        child: Text('Sohbeti Sonlandır ve Geçmişe Dön'),
      ),
    );
  }
}
