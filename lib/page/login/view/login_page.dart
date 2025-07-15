import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //logo
          Icon(Icons.lock, size: 100, color: Theme.of(context).colorScheme.primary,),

          //提示信息

          //username输入框

          //password输入框

          //记住密码和忘记密码

          //登录按钮

          //注册按钮

          //其他登录方式

        ],

    ),);
  }
}