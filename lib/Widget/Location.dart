import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class locationWidget extends StatefulWidget {
  const locationWidget({super.key});

  @override
  State<locationWidget> createState() => _locationWidgetState();
}

class _locationWidgetState extends State<locationWidget> {
  Position? position;

  fetchposition()async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      Fluttertoast.showToast(msg: "Location service is disabled");
    }

    permission=await Geolocator.checkPermission();

    if(permission==LocationPermission.denied)
    {
        permission = await Geolocator.requestPermission();
        if(permission==LocationPermission.denied)
          {
            Fluttertoast.showToast(msg: "You denied the permission");
          }
    }
    if(permission==LocationPermission.deniedForever)
    {
        Fluttertoast.showToast(msg: "You denied the permission forever");
    }

    Position currentPosition = await Geolocator.getCurrentPosition();

    setState(() {
      position=currentPosition;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: Text(
        position==null?'Location':position.toString(),
      ),
    );
  }
}
