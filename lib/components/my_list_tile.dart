import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const MyListTile({Key? key, required this.text, required this.icon, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListTile(
        leading: Icon(icon,color: Colors.grey,),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
