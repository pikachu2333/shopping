import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test6_26/page/home/provider/home_provider.dart';

class HomeCountPushWidget extends StatelessWidget {
  final Widget Function(HomeProvider provider) builder;

  const HomeCountPushWidget({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: HomeProvider.homepageId,
      init: HomeProvider.to,
      builder: builder,
    );
  }
}
