import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pooling/Screens/LoginScreen.dart';
import 'package:pooling/Screens/Profile.dart';
import 'package:pooling/Screens/SignUpScreen.dart';

import '../Widget/home.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;
  int myIndex=0;
  List<Widget> widgetList=[Home(),signUpScreen(),profileWidget()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
        setState(() {
          myIndex=index;
        });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'Profile'
          ),
      ],),
    );
  }
}
