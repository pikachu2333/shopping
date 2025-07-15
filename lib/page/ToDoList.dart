import 'package:flutter/material.dart';
import 'package:slideable/slideable.dart';

import '../bean/ToDoListBean.dart';

class ToDoList extends StatelessWidget {
  final ToDoListBean toDoListBean;
  Function(bool?)? onChanged;
  Function() deleteFunction;

  ToDoList({
    super.key,
    required this.toDoListBean,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slideable(
        items: [
          ActionItems(
            radius: BorderRadius.circular(12),
            backgroudColor: Colors.red,
            icon: Icon(Icons.delete),
            onPress: deleteFunction,
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Checkbox(
                  value: toDoListBean.taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  toDoListBean.taskName,
                  style: TextStyle(
                    decoration:
                        toDoListBean.taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
