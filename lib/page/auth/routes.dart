import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/page/auth/bingding.dart';
import 'package:test6_26/page/auth/view/auth_page.dart';


class AuthPageRoutes {
  static const String authPageName = "/auth_page";


  static final GetPage  authPage= GetPage(
      name: authPageName,
      page: () => AuthPage(),
      binding: AuthPageBinding());


  static Future? toAuthPage() async {
    return Get.toNamed(authPageName);
  }
}
