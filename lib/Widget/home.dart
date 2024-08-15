import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
   Map<String,dynamic>? userData;


  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;
  @override

  void init()
  {
    super.initState();
    _fetchUserData();
  }
  void _fetchUserData ()async
  {
    final User? user= _auth.currentUser;
    if(user!=Null)
      {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user?.uid).get(); // Fetch user data from Firestore
        setState(() {
          userData = userDoc.data() as Map<String, dynamic>?; // Update state with fetched data
        });
      }
  }


  List<String> menu=['Address','Time','Stop1','Stop2','Stop3','Stop4'];
  List<IconData> pic=[Icons.place,Icons.access_time,Icons.place_outlined,Icons.place_outlined,Icons.place_outlined,Icons.place_outlined];

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
          SizedBox(height: 15,),
          Center(
            child: ElevatedButton(
                onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addDriver()));
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  )
                ),
                child: Text("Find Customer",style: TextStyle(color: Colors.white),)
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(

                onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addDriver()));
                },

                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    elevation: 5,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    )
                ),
                child: Text("Book Ride",style: TextStyle(color: Colors.white))
            ),
          ),
          SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.all(15),
          width: w,
          height: 170,
          decoration: BoxDecoration(
            //shape:
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple
          ),
          child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty ?? true) {
              return Center(child: Text('No Data Available'));
              }

              final users = snapshot.data?.docs;

              return ListView.builder(
              itemCount: users?.length ?? 0,
              itemBuilder: (context, index) {
              final user = users?[index].data() as Map<String, dynamic>?;

              return ListTile(
              title: Text('Address: ${user?['address'] ?? 'N/A'}'),
              subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Time: ${user?['timing'] ?? 'N/A'}'),
              Text('Stop 1: ${user?['Stop1'] ?? 'N/A'}'),
              Text('Stop 2: ${user?['Stop2'] ?? 'N/A'}'),
              Text('Stop 3: ${user?['Stop3'] ?? 'N/A'}'),
              Text('Stop 4: ${user?['Stop4'] ?? 'N/A'}'),
              ],
              ),
              );
              },
              );}
              ),
        )


    ],
      ),
    );
  }
}




