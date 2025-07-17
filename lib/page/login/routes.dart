import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/page/login/bingding.dart';
import 'package:test6_26/page/login/view/login_page.dart';


class LoginPageRoutes {
  static const String loginPageName = "/login_page";


  static final GetPage  loginPage= GetPage(
      name: loginPageName,
      page: () => LoginPage(),
      binding: LoginPageBinding());


  static Future? toLoginPage() async {
    return Get.toNamed(loginPageName);
  }
}
