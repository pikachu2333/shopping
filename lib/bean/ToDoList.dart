import 'package:flutter/material.dart';
import 'ToDoListBean.dart';

class ToDoList extends StatelessWidget {
  final ToDoListBean toDoListBean;
  final Function(bool?)? onChanged;
  final Function() deleteFunction;

  const ToDoList({
    super.key,
    required this.toDoListBean,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      // 1. 使用 Dismissible 替换 Slideable
      child: Dismissible(
        // 关键：Key 必须唯一且与数据绑定，防止删除后列表错位
        key: ValueKey(toDoListBean.taskName),

        // 滑动方向：从右向左滑
        direction: DismissDirection.endToStart,

        // 滑动时的背景（通常是红色删除底色）
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),

        // 确认删除后的回调
        onDismissed: (direction) {
          deleteFunction();
        },

        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            // 2. 局部刷新监听
            child: ValueListenableBuilder<bool>(
              valueListenable: toDoListBean.isCompletedNotifier,
              builder: (context, isCompleted, child) {
                return Row(
                  children: [
                    Checkbox(
                      // 3. 注意：这里必须用 builder 传回来的 isCompleted
                      value: isCompleted,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                    Text(
                      toDoListBean.taskName,
                      style: TextStyle(
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}