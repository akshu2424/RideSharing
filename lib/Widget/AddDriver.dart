import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pooling/Screens/BottomNavigationBar.dart';
import 'package:pooling/Screens/LoginScreen.dart';
import 'package:pooling/Widget/FindCustomer.dart';
import 'package:pooling/Widget/home.dart';

class addDriver extends StatefulWidget {
  const addDriver({super.key});

  @override
  State<addDriver> createState() => _addDriverState();
}

class _addDriverState extends State<addDriver> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  var aadharController = TextEditingController();
  var licenseController = TextEditingController();
  var vehicleNoController = TextEditingController();
  var vehicleTypeController = TextEditingController();

  void _addDriver() async {
    if(_formKey.currentState!.validate())
    {
      User?user=FirebaseAuth.instance.currentUser;
      if(user!=null)
      {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
            {
              'vehicleNumber': vehicleNoController.text,
              'aadharNumber': aadharController.text,
              'licenseNumber': licenseController.text,
              'vehicleType': vehicleTypeController.text,
            });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Details updated successfully')),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>findCustomer()));

      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Ocuured')),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    late double w = MediaQuery.of(context).size.width;
    late double h=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Row(
          children: [
            IconButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavigatorBar()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
            ),
            SizedBox(width: 20,),
            Text("Create Driver Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          height: h/1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.purple[300],
          ),
          child: SingleChildScrollView(
            child: Form(
              key:_formKey,
              child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: aadharController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          labelText: "AadharCard",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter AadharCard No.",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an AadharCard No.';
                          }
                          if (value.length<12|| value.length>12) {
                            return 'Please enter a valid AadharCard No.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: licenseController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          labelText: "Licence",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Licence No.",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Licence No.';
                          }
                          if (value.length < 16 || value.length>16) {
                            return 'Enter valid Licence No.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: vehicleNoController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.car_rental_outlined,
                            color: Colors.white,
                          ),
                          labelText: "Vehicle No.",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter a Vehicle No.",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Vehicle No.';
                          }
                          return null;
                        },
            
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DropdownButtonFormField<String>(
            
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.car_rental_outlined,
                            color: Colors.white,
                          ),
                          labelText: "Vehicle Type",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter your Vehicle Type",
                        ),
            
                        items: <String>['Car','Bike'].map((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Vehicle Type';
                          }
                          return null;
                        },
            
                        onChanged: (String? newValue) {
                          setState(() {
                            vehicleTypeController.text = newValue!;
                          });
                        },
                        value: vehicleTypeController.text.isNotEmpty ? vehicleTypeController.text : null,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: _addDriver,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
