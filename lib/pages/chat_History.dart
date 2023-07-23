import 'package:flutter/material.dart';
import 'package:burc/core/extensions/context_extensions.dart'; // Eğer bu uzantıları kullanıyorsanız eklemeyi unutmayın

class ChatHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  ChatHistoryScreen({this.messages = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Sohbet Geçmişi'),
    ),
    body: Container(
    padding: EdgeInsets.all(16),
    child: ListView.builder(
    itemCount: messages.length,
    itemBuilder: (context, index) {
    final chat = messages[index];
    final username = chat['username'] ?? '';
    final message = chat['message'] ?? '';
    final timestamp = chat['timestamp'] as DateTime?;

    return ListTile(
    title: Text(
    '$username: $message',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    ),
    ),
    subtitle: Text(
    timestamp != null
    ? 'Tarih: ${timestamp.day}/${timestamp.month}/${timestamp.year} Saat: ${timestamp.hour}:${timestamp.minute}'
        : '',
    ),
    );
    },
    ),
    ));
  }
  }
    // Geri butonunu ekleyelim.
    // Bu butona basıldığında ChatScreen'e dönüş yapacak.
