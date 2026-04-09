import 'package:flutter/cupertino.dart';

class ToDoListBean {
  String taskName;
  final ValueNotifier<bool> isCompletedNotifier;
  // 构造函数，用于创建ToDoListBean对象
  ToDoListBean(this.taskName, bool initialStatus)
      : isCompletedNotifier = ValueNotifier(initialStatus);

  bool get taskCompleted => isCompletedNotifier.value;
}
