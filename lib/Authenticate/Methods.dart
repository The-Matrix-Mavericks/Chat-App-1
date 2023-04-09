import 'package:chat/Authenticate/LoginScree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(
    String name, String email, String password, String number) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "number": number,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
      "url":
          "https://imgs.search.brave.com/05TBeNcAKK_r3R0LB3pKtpxtWDXWh8ivakrk0aYd5_I/rs:fit:322:294:1/g:ce/aHR0cHM6Ly9zdGVl/bWl0aW1hZ2VzLmNv/bS9EUW1XQW9lVXBR/RFRaaUNoSjUxTFRG/U0NBMndWcUEybWpZ/WlVUWE5teldVS1pO/Qi9kb2N1Ym90Lmdp/Zg.gif"
    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    LoginSuccessful();
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } catch (e) {
    LoginSuccessful();
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}

class LoginSuccessful extends StatelessWidget {
  const LoginSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Successfully"),
      ),
    );
  }
}
