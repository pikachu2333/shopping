import 'package:get/get.dart';
import 'package:test6_26/page/home/routes.dart';
import 'package:test6_26/page/login/routes.dart';
import 'package:test6_26/page/pagetwo/routes.dart';
import '../page/register/routes.dart';
import '../service/auth/routes.dart';
// 定义一个AppPages类，用于存储路由信息
class AppPages{
  // 定义一个静态的pages变量，用于存储路由信息
  static final pages=<GetPage>[

    HomepageRoutes.homePage,

    PageTwoRoutes.pageTwo,

    RegisterPageRoutes.registerPage,

    LoginPageRoutes.loginPage,

    AuthPageRoutes.authPage,





  ];
}