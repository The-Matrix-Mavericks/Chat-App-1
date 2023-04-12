import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Username"),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password"),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_slash),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: Color(0xFF7165D6),
                  borderRadius: BorderRadius.circular(10),
                  // surfaceTintColor: Colors.black,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginScreen1()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have any account?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen1()));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7165D6)),
                    ))
              ],
            ),
          ],
        )),
      ),
    );
  }
}

var grp1 = {
  'Fungal infection': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'Allergy': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'GERD': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
};
var grp2 = {
  'Chronic cholestasis': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'Drug Reaction': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'Peptic ulcer diseae': [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'AIDS':[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0]
};
var grp4 = {
  'Diabetes': [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'Gastroenteritis': [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0],
  'Varicose veins': [1, 2],
  'Arthritis': [1, 2],
  'Osteoarthristis': [1, 2],
  'Hypoglycemia': [1, 2],
  'Hyperthyroidism': [1, 2],
  'Hypothyroidism': [1, 2],
};
var grp5 = {
  '(vertigo) Paroymsal  Positional Vertigo': [1, 2, 3, 4],
  'Acne': [1, 2, 3],
  'Urinary tract infection': [1, 2],
  'Impetigo': [1, 2],
  'Psoriasis': [1, 2],
};
var grp6 = {
  'Hypertension ': [1, 2, 3, 4],
  'Migraine': [1, 2, 3],
  'Cervical spondylosis': [1, 2],
  'Paralysis (brain hemorrhage)': [1, 2],
};
var grp3 = {
  'Jaundice': [1, 2, 3, 4],
  'Malaria': [1, 2, 3],
  'Chicken pox': [1, 2],
  'Typhoid': [1, 2],
  'Dengue': [1, 2],
};
var grp7 = {
  'hepatitis A': [1, 2, 3, 4],
  'Hepatitis B': [1, 2, 3],
  'Hepatitis C': [1, 2],
  'Hepatitis D': [1, 2],
  'Hepatitis E': [1, 2],
  'Alcoholic hepatitis': [1, 2],
};
var grp8 = {
  'Pneumonia': [1, 2, 3, 4],
  'Common Cold': [1, 2, 3],
  'Tuberculosis': [1, 2]
};
var grp9 = {
  'Dimorphic hemmorhoids(piles)': [1, 2, 3, 4],
  'Heart attack': [1, 2]
};
