import 'package:flutter/material.dart';
import 'package:test6_26/bean/ToDoList.dart';
import 'package:test6_26/util/dialog_box.dart';

import '../../bean/ToDoListBean.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<ToDoListBean> toDoList = [
    ToDoListBean("1", false),
    ToDoListBean("2", false),
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index].taskCompleted = !toDoList[index].taskCompleted;
    });
  }

  void saveNewTask(String text) {
    setState(() {
      toDoList.add(ToDoListBean(text, false));
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog_box(
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            toDoListBean: toDoList[index],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: () => deleteTask(index),
          );
        },
      ),
    );
  }
}
