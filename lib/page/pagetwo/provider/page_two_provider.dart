import 'package:get/get.dart';

class PageTwoProvider extends GetxController {
  static PageTwoProvider get to => Get.find();

  static const String PageTwoId = 'PageTwoId';
  RxInt count=0.obs;
  var msg='';


  void increment() => count++;

  void ToJumpTwo() {
    Get.toNamed('/home_page');
  }
}
