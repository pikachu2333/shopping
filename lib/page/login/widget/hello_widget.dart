import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test6_26/components/my_button.dart';
import 'package:test6_26/components/my_textfield.dart';
import 'package:test6_26/page/login/provider/login_page_controller.dart';

import '../../../components/square_tile.dart';

class HelloWidget extends StatelessWidget {
  final LoginPageController controller;

  HelloWidget({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                //logo
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(height: 50),
                //提示信息
                Text(
                  '请登录您的账户',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                //username输入框
                SizedBox(height: 25),
                MyTextField(
                  hintText: 'Email',
                  obscureText: false,
                  controller: controller.emailController,
                ),
                SizedBox(height: 25),
                //password输入框
                MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: controller.passwordController,
                ),
                //记住密码和忘记密码
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '忘记密码？',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                //登录按钮
                SizedBox(height: 25),
                MyButton(
                  onTap: controller.signUserIn,
                  child: Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                //注册按钮
                SizedBox(height: 25),
                MyButton(
                  onTap: ()=>Get.toNamed('/register_page'),
                  child: Text(
                    '注册',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        '其他登录方式',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),

                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                //其他登录方式
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: "lib/img/img_apple_logo.png"),
                    SizedBox(width: 25),
                    SquareTile(imagePath: "lib/img/img_google_logo.png"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
