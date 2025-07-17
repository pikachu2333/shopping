import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: CupertinoSwitch(
          value: Provider.of<ThemeProvider>(context).isDarkMode,
          onChanged: (value) {
            Provider.of<ThemeProvider>(context, listen: false).toggleThemeData();
          },
        ),
      ),
    );
  }
}
