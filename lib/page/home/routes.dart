import 'package:get/get.dart';
import 'package:test6_26/page/home/view/home_page.dart';

class HomepageRoutes {
  static const String homePageName = '/home_page';

  static final  GetPage homePage= GetPage(
  name: homePageName,
  page: () =>  HomePage());

  static Future? toHomePage() async{
    return Get.toNamed(homePageName);
  }
}