import 'package:flutter/material.dart';
import 'package:test6_26/util/my_bottom.dart';

typedef SaveFunction = Function(String text);

class dialog_box extends StatefulWidget {
  SaveFunction onSave;
  VoidCallback onCancel;

  dialog_box({super.key, required this.onSave, required this.onCancel});

  @override
  State<dialog_box> createState() => _dialog_boxState();
}

class _dialog_boxState extends State<dialog_box> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "输入新任务",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                my_bottom(
                  text: "save",
                  onpressed: () {
                    if (textEditingController.text.isEmpty) {
                      return;
                    }
                    widget.onSave(textEditingController.text);
                    textEditingController.clear();
                  },
                ),
                const SizedBox(width: 8),
                my_bottom(text: "cancel", onpressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
