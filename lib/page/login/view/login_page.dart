
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test6_26/page/login/provider/login_page_controller.dart';
import 'package:test6_26/page/login/widget/hello_widget.dart';

class LoginPage extends GetView<LoginPageController> {
  final controller=Get.put(LoginPageController());
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      id: LoginPageController.updateId,
      builder: (LoginPageController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(child: HelloWidget(controller: controller)),
        );
      },
    );
  }
}
