import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/components/home_count_push_widget.dart';
import 'package:test6_26/page/home/provider/home_provider.dart';

// 定义HomePage类，继承自StatelessWidget
class HomePage extends StatelessWidget {
  // 构造函数
  const HomePage({Key? key}) : super(key: key);

  // 构建函数
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProvider>(
      init: HomeProvider(),
      id: HomeProvider.homepageId,
      builder: (HomeProvider controller) {
        return _buildView(controller);
      },
    );
  }

  Widget _buildView(HomeProvider controller) {
    return Container(child: getHomeWidget(controller));
  }

  Widget getHomeWidget(HomeProvider controller) {
    return HomeCountPushWidget(
      // builder函数
      builder: (cl) {
        // 返回Scaffold组件
        return Scaffold(
          // 设置AppBar
          appBar: AppBar(),
          // 设置body
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () => controller.ToJumpTwo(),
                child: const Icon(Icons.arrow_forward_outlined),
              ),
              Center(
                // 设置居中对齐
                child: Column(
                  // 设置垂直居中对齐
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 设置子组件
                  children: [
                    // 使用Obx函数监听cl.count的变化
                    Obx(() => Text("${cl.count}")),
                    // 设置ElevatedButton组件
                    ElevatedButton(
                      // 设置点击事件
                      onPressed: cl.increment,
                      // 设置按钮文本
                      child: Text(
                        '点我',
                        // 设置文本样式
                        style: TextStyle(
                          // 设置文本颜色
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
