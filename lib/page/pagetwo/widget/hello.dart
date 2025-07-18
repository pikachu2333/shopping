import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/page/pagetwo/provider/page_two_provider.dart';

import '../../home/provider/home_provider.dart';

class HelloWidget extends StatelessWidget {
  final HomeProvider homePagecontroller = Get.put(HomeProvider());
  final PageTwoProvider controller;

  HelloWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(controller.context).colorScheme.background,
      appBar: AppBar(title: const Text('跨页面-two')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.increment();
                //homePagecontroller.increment();
              },
              child: Icon(Icons.add),
            ),
            Center(
              child: Column(
                children: [
                  GetBuilder<HomeProvider>(
                    builder: (logic) {
                      return Text('homePagecontroller: ${logic.count}',style: TextStyle(color: Theme.of(controller.context).colorScheme.inversePrimary),);
                    },
                  ),

                  Obx(()=> Text('pageTwocontroller: ${controller.count}',style: TextStyle(color: Theme.of(controller.context).colorScheme.inversePrimary),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
