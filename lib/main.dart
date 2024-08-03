import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pooling/Screens/BottomNavigationBar.dart';
// import 'dart:js';
import 'Screens/SplashScreen.dart';
import 'Widget/FindCustomer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp() ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pooling Ride",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      //home: splashScreen(),
      home: findCustomer(),
    );
  }
}

