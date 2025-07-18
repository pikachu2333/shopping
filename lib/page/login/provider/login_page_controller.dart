import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../service/auth/service/auth_service.dart';

class LoginPageController extends GetxController {
  static String updateId = "loginPageControllerUpdateId";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  get context => Get.context!;
  final _auth = AuthService();

  void signUserIn() async {
    // 显示加载动画
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      // 使用FirebaseAuth实例进行用户登录
      await _auth.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
      // 关闭加载动画
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // 关闭加载动画
      Navigator.pop(context);
      // 根据错误代码进行不同的处理
      if (e.code == 'invalid-email') {
        // 邮箱格式错误
        wrongEmailMessage();
      } else if (e.code == 'invalid-credential') {
        // 密码错误
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text("邮箱格式错误"));
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text("密码错误"));
      },
    );
  }
}
