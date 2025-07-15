import 'package:flutter/material.dart';
import 'package:test6_26/page/home/view/home_page.dart';
import 'package:test6_26/page/shop/intro_page.dart';
import 'package:test6_26/page/note_page.dart';

class first_page extends StatefulWidget {
  first_page({Key? key}) : super(key: key);

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  final List _page = [HomePage(), NotePage(), IntroPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
          //title: Text("Yuni")
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite, size: 50)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home_page');
              },
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text("N O T E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/note_page');
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text("S H O P"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/shop_page');
              },
            ),
          ],
        ),
      ),
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Note"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
        ],
      ),
    );
  }
}
