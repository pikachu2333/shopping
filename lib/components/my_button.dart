import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const MyButton({Key? key, this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1,),
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),

        child: child,
      ),
    );
  }
}
