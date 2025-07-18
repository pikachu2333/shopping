import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test6_26/components/my_textfield.dart';
import 'package:test6_26/service/chat/chat_service.dart';

import '../../../service/auth/service/auth_service.dart';

class ChatPage extends StatelessWidget {
  final String receverEmail;
  final String receverID;
  final TextEditingController _messageController = TextEditingController();
  ChatPage({Key? key, required this.receverEmail, required this.receverID})
    : super(key: key);

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final User? user = FirebaseAuth.instance.currentUser;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receverID, _messageController.text);
      _messageController.clear();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receverEmail)),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildMessageInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.currentUser!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return Text(data['message']);
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Typp a message",
            obscureText: false,
          ),
        ),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward)),
      ],
    );
  }
}
