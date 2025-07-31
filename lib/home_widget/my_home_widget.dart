import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:test6_26/home_widget/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        GetPage(name: '/second', page: () => const SecondPage()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //home widget stuff
  String appGroupId = 'group.homeScreenApp';
  String iOSWidgetName = "MyHomeWidget";
  String androidWidgetName = "MyHomeWidget";
  String dataKey = "text_from_flutter_app";


  static const platform = MethodChannel('com.example/my_channel');

  // Function to invoke native method
  Future<void> openAppWithExtras() async {
    try {
      // Send data to Android via the channel
      await platform.invokeMethod('openAppWithExtras', {
        'message': 'Hello from Flutter!',
      });
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  void initState() {
    super.initState();
    HomeWidget.setAppGroupId(appGroupId);
    print("Widget was clicked!");

     // 初始化桌面小组件监听器
  }
  void onready(){
    _initHomeWidgetListener();
  }

  bool _isNavigating = false;

  void _initHomeWidgetListener() {
    HomeWidget.registerInteractivityCallback((Uri? uri) {
      if (!_isNavigating) {
        _isNavigating = true;
        Get.to(() => const SecondPage())?.then((_) {
          _isNavigating = false;  // Reset when navigation is done
        });
      }
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    String data = "Count=${_counter}";
    await HomeWidget.saveWidgetData(dataKey, data);

    await HomeWidget.updateWidget(
      iOSName: iOSWidgetName,
      androidName: androidWidgetName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                // 跳转到第二个页面
                Get.toNamed('/second');
              },
              child: const Text("Go to Second Page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
