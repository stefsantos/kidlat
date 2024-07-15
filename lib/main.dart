import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kidlat/pages/auth_page.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'pages/SignUp/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // Set AppBar background color to white
          iconTheme: IconThemeData(color: Colors.black), // Set AppBar icon color to black
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // Set AppBar title color to black
        ),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}



