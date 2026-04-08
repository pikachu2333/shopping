import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';

class MyHomeWidgetSync {
  static const String androidWidgetName = 'MyHomeWidget';
  static const String iOSWidgetName = 'MyHomeWidget';
  static const MethodChannel _channel = MethodChannel('com.example/my_channel');

  static const String keyTitle = 'shopping_widget_title';
  static const String keyCartCount = 'shopping_widget_cart_count';
  static const String keyCartTotal = 'shopping_widget_cart_total';
  static const String keyStatus = 'shopping_widget_status';

  static bool _initialized = false;
  static String? _pendingAction;

  static Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onWidgetAction') {
        final action = (call.arguments as Map?)?['action'] as String?;
        if (action != null) {
          _pendingAction = action;
          _tryHandlePendingAction();
        }
      }
    });

    final String? initialAction = await _getInitialWidgetAction();
    if (initialAction != null) {
      _pendingAction = initialAction;
      _tryHandlePendingAction();
    }
  }

  static Future<void> _tryHandlePendingAction() async {
    if (_pendingAction != 'open_cart') return;

    if (Get.key.currentContext == null) {
      Future.delayed(const Duration(milliseconds: 300), _tryHandlePendingAction);
      return;
    }

    _pendingAction = null;
    _openCartPage();
  }

  static Future<String?> _getInitialWidgetAction() async {
    try {
      return await _channel.invokeMethod<String>('getInitialWidgetAction');
    } on PlatformException {
      return null;
    }
  }

  static void _openCartPage() {
    if (Get.currentRoute != '/cart_page') {
      unawaited(Get.toNamed('/cart_page'));
    }
  }

  static Future<void> syncCartData({
    required int count,
    required String total,
  }) async {
    final status = count == 0 ? '购物车为空' : '共 $count 件商品';

    await HomeWidget.saveWidgetData<String>(keyTitle, '购物车');
    await HomeWidget.saveWidgetData<String>(keyCartCount, '$count');
    await HomeWidget.saveWidgetData<String>(keyCartTotal, total);
    await HomeWidget.saveWidgetData<String>(keyStatus, status);

    await HomeWidget.updateWidget(
      androidName: androidWidgetName,
      iOSName: iOSWidgetName,
    );
  }
}
