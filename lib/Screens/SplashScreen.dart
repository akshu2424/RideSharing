// import 'dart:async';
// import 'dart:js';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pooling/Screens/BottomNavigationBar.dart';
import 'package:pooling/Screens/Profile.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
   void initState()  {
     super.initState();
     Timer(Duration(seconds: 3), () {
       Navigator.pushReplacement(
           context as BuildContext, MaterialPageRoute(builder: (context) => loginScreen()));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Pooling",
            style: TextStyle(
                fontSize: 80, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
