import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test6_26/page/home/view/home_page.dart';
import 'package:test6_26/page/pagetwo/provider/page_two_provider.dart';

import '../../home/provider/home_provider.dart';

class HelloWidget extends StatelessWidget {
  final HomeProvider homePagecontroller = Get.put(HomeProvider());
  final PageTwoProvider controller;

  HelloWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      return Text('homePagecontroller: ${logic.count}');
                    },
                  ),

                  Obx(()=> Text('pageTwocontroller: ${controller.count}')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
