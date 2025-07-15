import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/page/pagetwo/widget/hello.dart';
import '../../home/provider/home_provider.dart';
import '../provider/page_two_provider.dart';


class PagetwoPage extends GetView<PageTwoProvider> {
  final PageTwoProvider pagetwoProvider = Get.put(PageTwoProvider());
  PagetwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageTwoProvider>(
      init: PageTwoProvider.to,
      id: PageTwoProvider.PageTwoId,
      builder: (PageTwoProvider controller) {
        return _buildView(controller);
      }
    ) ;
  }
  Widget _buildView(PageTwoProvider controller) {
    return Container(child: GetPageTwoWidget(controller));
  }

  Widget GetPageTwoWidget(PageTwoProvider controller) {

    return HelloWidget(controller: controller);

  }

}
