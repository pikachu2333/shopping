import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/page/shop/shop_home/shop_home_provider.dart';
import 'package:test6_26/page/shop/shop_page.dart';

import '../../../components/bottom_nav_bar.dart';
import '../cart/cart_page.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopHomeProvider>(
      builder: (context, shopHomeProvider, child) {
        final controller = PageController(
          initialPage: shopHomeProvider.selectedIndex,
        );
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            onTabChange: (index) {
              // 更新选中的页面索引
              shopHomeProvider.setSelectedIndex(index);
              controller.jumpToPage(index);
            },
          ),
          body: PageView(
            controller: controller,
            onPageChanged: (index) {
              // 页面滑动时同步更新选中的页面索引
              shopHomeProvider.setSelectedIndex(index);
            },
            children: const [ShopPage(), CartPage()],
          ),
        );
      },
    );
  }
}
