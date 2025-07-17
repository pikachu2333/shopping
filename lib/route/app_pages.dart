import 'package:get/get.dart';

import 'package:test6_26/page/home/routes.dart';
import 'package:test6_26/page/login/routes.dart';
import 'package:test6_26/page/pagetwo/routes.dart';
import 'package:test6_26/register/routes.dart';

// 定义一个AppPages类，用于存储路由信息
class AppPages{
  // 定义一个静态的pages变量，用于存储路由信息
  static final pages=<GetPage>[
   // 将HomePage路由信息添加到pages变量中
   HomepageRoutes.homePage,
    // 将PageTwo路由信息添加到pages变量中
    PageTwoRoutes.pageTwo,
    RegisterPageRoutes.registerPage,
    LoginPageRoutes.loginPage,




  ];
}