import 'package:get/get.dart';


class HomeProvider extends GetxController {
  static HomeProvider get to => Get.find();

  static const String homepageId = 'homepageId';

  RxInt count = 0.obs;

  void increment() => count++;

  void ToJumpTwo() {
    Get.toNamed('/page_two_page');
  }
}
