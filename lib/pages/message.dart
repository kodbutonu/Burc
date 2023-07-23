import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessagePage extends StatefulWidget {
  final String? currentUserEmail;
  final String username;
  final int deger;
  const MessagePage({
    required this.deger,
    required this.currentUserEmail,
    required this.username,
  });

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  CollectionReference alaaddinMessagesCollection =
  FirebaseFirestore.instance.collection('alaaddin');
  CollectionReference burcuMessagesCollection =
  FirebaseFirestore.instance.collection('burcuabla');

  List<Map<String, dynamic>> messages = [];
  TextEditingController messageController = TextEditingController();

  void sendMessage(String message) async {
    await alaaddinMessagesCollection.add({
      'message': message,
      'isFromMedyum': true, // Mesajın medyumdan geldiğini belirtiyoruz
      'email': widget.currentUserEmail, // E-posta adresini kaydediyoruz
      'username': 'Alaaddin', // Medyum kullanıcı adını kaydediyoruz
      'timestamp': DateTime.now(),
    });
    messageController.clear();
  }

  void sendReply(String message) async {
    await burcuMessagesCollection.add({
      'message': message,
      'isFromMedyum': false, // Mesajın danışandan geldiğini belirtiyoruz
      'email': widget.currentUserEmail, // E-posta adresini kaydediyoruz
      'username': 'Burcu Abla', // Kullanıcı adını kaydediyoruz
      'timestamp': DateTime.now(),
    });
    messageController.clear();
  }

  @override
  void initState() {
    super.initState();
    alaaddinMessagesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      setState(() {
        messages = snapshot.docs
            .map<Map<String, dynamic>>((doc) => doc.data() as Map<String, dynamic>? ?? {})
            .toList();
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isFromMedyum = message['isFromMedyum'] ?? false;
                final text = message['message'] ?? '';
                final timestamp = message['timestamp']?.toDate();

                final formattedTimestamp = timestamp != null
                    ? DateFormat('HH:mm').format(timestamp)
                    : '';

                return ListTile(
                  title: Text(
                    widget.deger == 1 ? 'Alaaddin: $text' : 'Burcu Abla: $text',
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
                    if (messageController.text.isNotEmpty) {
                      if (widget.deger == 1) {
                        sendMessage(messageController.text);
                      } else {
                        sendReply(messageController.text);
                      }
                    }
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
