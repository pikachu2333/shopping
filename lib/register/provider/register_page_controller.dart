import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegisterPageController extends GetxController {
  static String updateId = "registerPageControllerUpdateId";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  get context => Get.context!;

  void signUserUp() async {
    // 显示加载动画
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      // 使用FirebaseAuth实例进行用户登录
      if (passwordController.text == passwordConfirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // 密码不一致
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text("两次输入的密码不一致"));
          },
        );
      }
      Get.toNamed('auth_page');
      Get.snackbar(
        "注册成功",
        "恭喜您成功注册！",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    } on FirebaseAuthException catch (e) {
      // 关闭加载动画
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text(message));
      },
    );
  }
}
