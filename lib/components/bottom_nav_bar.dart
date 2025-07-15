import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTabChange});

  final Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: (index) => onTabChange!(index),
          tabBorderRadius: 16,

          tabs: [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
          ],
        ),
      ),
    );
  }
}
