import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pooling/Screens/BottomNavigationBar.dart';

class profileWidget extends StatefulWidget {
  const profileWidget({super.key});
  @override
  State<profileWidget> createState() => _profileWidgetState();
}

class _profileWidgetState extends State<profileWidget> {

  final FirebaseAuth _auth = FirebaseAuth.instance; // Added to get the current user
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Added to fetch data from Firestore
  Map<String, dynamic>? userData; // Added to store fetched user data

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget initializes
  }

  void _fetchUserData() async {
    User? user = _auth.currentUser; // Get the current authenticated user
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get(); // Fetch user data from Firestore
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>?; // Update state with fetched data
      });
    }
  }


  List<String> menu = ['Name', 'Email', 'Phone No.', 'Help'];
  List<IconData> pic = [Icons.person, Icons.email,Icons.phone,Icons.help];
  @override
  Widget build(BuildContext context) {
    late double w = MediaQuery.of(context).size.width;
    late double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BottomNavigatorBar()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              color: Colors.white,
            ),
            SizedBox(width: 70,),
            Text(
              "Profile",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 150,
              width: w,
              padding: EdgeInsets.only(left: 10,top:10,right:10),
              child: GestureDetector(
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border:Border.all(width: 4,color: Colors.black),
                              boxShadow: [BoxShadow(
                                spreadRadius: 4,
                                color: Colors.grey
                              )],
                              shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://imgs.search.brave.com/_6FEB4MbPEVvT0I32zB9Jp8t6DR9xNKO3Itls1wvXus/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTI4/MTk5ODUxOS9waG90/by9wcm9maWxlLXBv/cnRyYWl0LW9mLXdv/bWFuLmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1NdF9meTNH/SzFka2hyR3BfUGtu/VmpFR2VNTWpfcVNB/QWJIWWtYLWYtMy1r/PQ'
                                  )
                                )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                              right: 0,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white
                                  ),
                                  color: Colors.grey
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                ),
                                ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 500,
              width: w,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (context,index){

                  String subtitle;
                  switch (index) {
                    case 0:
                      subtitle = userData?['username'] ?? 'Not Available'; // Display username
                      break;
                    case 1:
                      subtitle = userData?['email'] ?? 'Not Available'; // Display email
                      break;
                    case 2:
                      subtitle = userData?['phone'] ?? 'Not Available'; // Display phone number
                      break;
                    default:
                      subtitle = 'Required a Help ? ';
                  }

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      onTap: (){},
                      leading: Icon(pic[index]),
                      title: Text(menu[index]),
                      subtitle: Text(subtitle),
                    ),
                  );
        
                }
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
