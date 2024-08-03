import 'package:flutter/material.dart';
import 'package:pooling/Screens/LoginScreen.dart';
import 'package:pooling/Widget/AddDriver.dart';
import 'package:pooling/Widget/Location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Pooling",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.all(20),
          //     width: w * 0.8,
          //     child: TextField(
          //       decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: BorderSide(color: Colors.black,
          //               width: 2),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: BorderSide(color: Colors.grey,
          //               width: 2),
          //         ),
          //         prefixIcon: Icon(Icons.search),
          //         hintText: "Enter Pickup Location",
          //         suffixIcon: IconButton(
          //           onPressed: () {
          //             Navigator.push(context, MaterialPageRoute(builder: (context)=>locationWidget()));
          //           },
          //           icon:Icon(Icons.location_pin),
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Center(
          //   child: Container(
          //     margin: EdgeInsets.all(20),
          //     width: w * 0.8,
          //     child: TextField(
          //       decoration: InputDecoration(
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: BorderSide(color: Colors.black,
          //               width: 2),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: BorderSide(color: Colors.grey,
          //               width: 2),
          //         ),
          //         prefixIcon: Icon(Icons.search),
          //         hintText: "Search your destination",
          //         suffixIcon: IconButton(
          //           onPressed: () {
          //             Navigator.push(context, MaterialPageRoute(builder: (context)=>locationWidget()));
          //           },
          //           icon:Icon(Icons.location_pin),
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: ElevatedButton(
                onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addDriver()));
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
                child: Text("Find Customer")
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(
                onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addDriver()));
                },

                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )
                ),
                child: Text("Book Ride")
            ),
          ),


        ],
      ),
    );
  }
}




