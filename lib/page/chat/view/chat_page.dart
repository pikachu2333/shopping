import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receverEmail;
  const ChatPage({Key? key, required this.receverEmail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(receverEmail)));
  }
}
