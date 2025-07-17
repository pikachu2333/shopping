import 'package:get/get.dart';
import 'package:test6_26/page/pagetwo/view/page_two_page.dart';

class PageTwoRoutes {
  static const String pageTwoName = '/page_two_page';
  static final  GetPage pageTwo= GetPage(
      name: pageTwoName,
      page: () => PagetwoPage());

  static Future? toPageTwoPage() async{
    return Get.toNamed(pageTwoName);
  }
}