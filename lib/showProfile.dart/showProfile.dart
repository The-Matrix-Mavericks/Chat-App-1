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
                            : "https://imgs.search.brave.com/05TBeNcAKK_r3R0LB3pKtpxtWDXWh8ivakrk0aYd5_I/rs:fit:322:294:1/g:ce/aHR0cHM6Ly9zdGVl/bWl0aW1hZ2VzLmNv/bS9EUW1XQW9lVXBR/RFRaaUNoSjUxTFRG/U0NBMndWcUEybWpZ/WlVUWE5teldVS1pO/Qi9kb2N1Ym90Lmdp/Zg.gif"),
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
