// import 'dart:html';

import 'package:flutter/material.dart';
import '../Authenticate/CreateAccount.dart';
import '../Authenticate/LoginScree.dart';
// import 'package:medical_ui/main.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // Align(
            //     alignment: Alignment.centerRight,
            //     child: TextButton(
            //       onPressed: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => NavBarRoots()));
            //       },
            //       child: Text("SKIP",
            //           style: TextStyle(
            //             color: Color(0xFF7165D6),
            //             fontSize: 20,
            //           )),
            //     )),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(height: 40),
            Text(
              "The Doc is here 👋",
              style: TextStyle(
                  color: Color(0xFF7165D6),
                  fontSize: size.width / 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2),
            ),
            SizedBox(
              height: 20,
            ),
            // SizedBox(height: 50),
            Text("Tap to meet!",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: size.width / 14,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
