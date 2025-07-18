import 'package:get/get.dart';
import 'package:test6_26/service/chat/chat_service.dart';


class HomeProvider extends GetxController {
  static HomeProvider get to => Get.find();

  static const String homepageId = 'homepageId';
  get context => Get.context!;
  RxInt count = 0.obs;



  void increment() => count++;

  void ToJumpTwo() {
    Get.toNamed('/page_two_page');
  }
}
