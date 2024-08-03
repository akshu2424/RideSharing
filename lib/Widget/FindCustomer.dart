import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pooling/Screens/BottomNavigationBar.dart';

class findCustomer extends StatefulWidget {

  @override
  State<findCustomer> createState() => _findCustomerState();
}

class _findCustomerState extends State<findCustomer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController addressController = TextEditingController();
  final TextEditingController  _timeController = TextEditingController();
  final TextEditingController stop1Controller = TextEditingController();
  final TextEditingController stop2Controller = TextEditingController();
  final TextEditingController stop3Controller = TextEditingController();
  final TextEditingController stop4Controller = TextEditingController();

  void _addRide() async {
    if(_formKey.currentState!.validate())
    {
      User?user=FirebaseAuth.instance.currentUser;
      if(user!=null)
      {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
            {
              'address': addressController.text,
              'timing': _timeController.text,
              'Stop1': stop1Controller.text,
              'Stop2': stop2Controller.text,
              'Stop3': stop3Controller.text,
              'Stop4': stop4Controller.text,
            });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(' Registration Successfull')),
        );

        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigatorBar()));

      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Ocuured')),
      );
    }

  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late double w= MediaQuery.of(context).size.width;
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
            Text("Add Ride Details",
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
          height: h/1.25,
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
                        controller: addressController,
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
                            Icons.place,
                            color: Colors.white,
                          ),
                          labelText: "Address",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Address",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Address';
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
                        controller: _timeController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.access_time),
                            onPressed: () => _selectTime(context),
                          ),
                          labelText: "Time",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter Time",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Time';
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
                        controller: stop1Controller,
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
                          labelText: "Stop1",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter first stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter stop';
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
                        controller: stop2Controller,
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
                          labelText: "Stop2",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter second stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter stop';
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
                        controller: stop3Controller,
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
                          labelText: "Stop3",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter third stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter stop';
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
                        controller: stop4Controller,
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
                          labelText: "Stop4",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Enter fourth stop",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter stop';
                          }
                          return null;
                        },

                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: _addRide,
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
    );;
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
}
