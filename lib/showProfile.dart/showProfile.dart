import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../Screens/ChatRoom.dart';

class ShowProfile extends StatefulWidget {
  final String email;
  ShowProfile({required this.email});
  // ShowProfile({super.key});

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _setMessage();
  }

  void _setMessage() {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(
      () {
        isLoading = true;
      },
    );
    _firestore
        .collection('users')
        .where("email", isEqualTo: "${widget.email}")
        .get()
        .then(
      (value) {
        setState(
          () {
            userMap = value.docs[0].data();
            isLoading = false;
          },
        );
        // print(userMap);
      },
    );
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Summary'),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              // height: 150,
              // width: 200,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 15,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/000/566/866/original/vector-person-icon.jpg'),
                        radius: 70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 70,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            userMap?['name'],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "designation",
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   userMap?['phone'],
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height / 70,
                          ),
                          Text(
                            userMap?['email'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
