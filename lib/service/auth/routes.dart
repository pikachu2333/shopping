
import 'package:get/get.dart';
import 'package:test6_26/service/auth/view/auth_page.dart';
import 'bingding.dart';


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
