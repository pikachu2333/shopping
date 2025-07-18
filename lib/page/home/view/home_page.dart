import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:test6_26/components/home_count_push_widget.dart';
import 'package:test6_26/components/user_tile.dart';
import 'package:test6_26/page/home/provider/home_provider.dart';
import 'package:test6_26/service/auth/service/auth_service.dart';
import 'package:test6_26/service/chat/chat_service.dart';

import '../../chat/view/chat_page.dart';

// 定义HomePage类，继承自StatelessWidget
class HomePage extends StatelessWidget {
  // 构造函数
  HomePage({super.key});
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // 构建函数
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUserList());
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading");
        }
        return ListView(
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(receverEmail: userData["email"]),
          ),
        );
      },
    );
  }
}
