import 'package:chat/screens2/welcome_screen.dart';
import 'package:chat/widgets/navbar_roots.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return NavBarRoots();
    } else {
      return WelcomeScreen1();
    }
  }
}
