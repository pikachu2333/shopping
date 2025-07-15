import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/models/shop.dart';
import 'package:test6_26/page/first_page.dart';
import 'package:test6_26/page/home/view/home_page.dart';
import 'package:test6_26/page/shop/cart/cart_page.dart';
import 'package:test6_26/page/shop/intro_page.dart';
import 'package:test6_26/page/note_page.dart';
import 'package:test6_26/page/shop/shop_home/shop_home_page.dart';
import 'package:test6_26/page/shop/shop_home/shop_home_provider.dart';
import 'package:test6_26/route/app_pages.dart';
import 'package:test6_26/theme/light_mode.dart';

import 'db/SqlitePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => ShopHomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // 定义一个名为MyApp的常量构造函数，接受一个可选的key参数
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: first_page(),
      routes: {
        '/first_page': (context) => first_page(),
        '/home_page': (context) => HomePage(),
        '/note_page': (context) => NotePage(),
        '/shop_page': (context) => IntroPage(),
        '/shop_home_page': (context) => ShopHome(),
        '/cart_page': (context) => CartPage(),
      },
      getPages: AppPages.pages,
    );
  }
}
