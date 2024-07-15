import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidlat/pages/login_page.dart';
import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          print('Auth state changed: ${snapshot.hasData}');
          
          // User is logged in
          if (snapshot.hasData) {
            return MyHomePage();
          } 
          // User is NOT logged in
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
