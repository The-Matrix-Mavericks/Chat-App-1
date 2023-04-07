import 'package:chat/Authenticate/LoginScree.dart';
import 'package:chat/Screens/HomeScreen.dart';
import 'package:chat/screens2/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens2/home_screen.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomeScreen1();
    } else {
      return WelcomeScreen();
    }
  }
}
