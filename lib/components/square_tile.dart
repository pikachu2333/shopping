import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  String imagePath;
  SquareTile({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.surface),
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Image.asset(imagePath, height: 40, width: 40, fit: BoxFit.cover),
    );
  }
}
