import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
        centerTitle: true,
        backgroundColor: Color(0xFF7165D6),
        title: Center(child: Text('Profile Summary')),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              // height: 150,
              // width: 170,
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
                        backgroundImage: NetworkImage(userMap?['url'] != null
                            ? "${userMap?['url']}"
                            : "https://imgs.search.brave.com/OMywKILzX0f3DNtkst-sUvxYARqoGLwLqh4pOHr58k8/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC4x/UXlzSk5lXzcydGtE/VHAtUHc4R0t3SGFI/YSZwaWQ9QXBp"),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                userMap?['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height / 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Phone Num. : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                userMap?['number'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height / 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Email Id : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                userMap?['email'],
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          )
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
