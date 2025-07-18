
import 'package:get/get.dart';

import 'package:test6_26/page/register/view/register_page.dart';

import 'bingding.dart';


class RegisterPageRoutes {
  static const String registerPageName = "/register_page";


  static final GetPage registerPage= GetPage(
      name: registerPageName,
      page: () => RegisterPage(),
      binding: RegisterPageBinding());


  static Future? toRegisterPage() async {
    return Get.toNamed(registerPageName);
  }
}
