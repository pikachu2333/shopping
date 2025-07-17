import 'package:flutter/material.dart';

class my_bottom extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  // 定义一个名为my_bottom的常量构造函数，接受一个可选的key和一个必需的text参数
  my_bottom({super.key, required this.text, required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.yellow[100],
      child: Text(text),
    );
  }
}
