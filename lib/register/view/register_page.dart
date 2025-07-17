import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:test6_26/register/provider/register_page_controller.dart';

import '/register/widget/hello_widget.dart';

class RegisterPage extends GetView<RegisterPageController> {
  final controller = Get.put(RegisterPageController());
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(
      id: RegisterPageController.updateId,
      builder: (RegisterPageController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(child: HelloWidget(controller: controller)),
        );
      },
    );
  }
}
