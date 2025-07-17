import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  String imagePath;
  final Function()? onTap;
  SquareTile({super.key, required this.imagePath, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
