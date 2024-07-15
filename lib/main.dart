import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kidlat/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kidlat/pages/start_page.dart';
import 'firebase_options.dart';


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
      home: const StartPage(),
    );
  }
}



