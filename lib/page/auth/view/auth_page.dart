import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test6_26/page/first_page.dart';
import 'package:test6_26/page/home/view/home_page.dart';
import 'package:test6_26/page/login/view/login_page.dart';
import 'package:test6_26/page/shop/shop_home/shop_home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is signed in
          if (snapshot.hasData) {
            return first_page();
          }
          // User is not signed in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
