import 'package:chat/Authenticate/CreateAccount.dart';
import 'package:chat/Authenticate/Methods.dart';
import 'package:chat/screens2/welcome_screen.dart';
import 'package:chat/widgets/navbar_roots.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: size.width / 0.5,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WelcomeScreen1(),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Image.asset("images/logo.png"),
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field(size, "Enter Email Id", "Email Id",
                            Icons.account_box, _email),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: field1(size, "Enter Password", "Password",
                              Icons.lock, _password),
                        ),
                      ),
                      customButton(size),
                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: Material(
                      //       color: Color(0xFF7165D6),
                      //       borderRadius: BorderRadius.circular(30),
                      //       // surfaceTintColor: Colors.black,
                      //       child: InkWell(
                      //         onTap: () => logIn(_email.text, _password.text),
                      //         child: Padding(
                      //           padding: EdgeInsets.symmetric(
                      //               vertical: 15, horizontal: 40),
                      //           child: Center(
                      //             child: Text(
                      //               "Sign In",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 25,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
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
                                        builder: (context) => CreateAccount()));
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
                  ),
                ),
              ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });

          logIn(_email.text, _password.text).then((user) {
            if (user != null) {
              // (); // if user
              setState(() {
                isLoading = false;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => LoginSuccessful()));
            } else {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginFailed()));
            }
          });
        } else {
          print("Please fill form correctly");
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Material(
            color: Color(0xFF7165D6),
            borderRadius: BorderRadius.circular(30),
            // surfaceTintColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Center(
                child: Text(
                  "Log In",
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
    );
  }

  Widget field(Size size, String hintText, String label, IconData icon,
      TextEditingController cont) {
    return Container(
      height: size.height / 10,
      width: size.width / 1.1,
      child: TextFormField(
        controller: cont,
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return "Please enter valid email";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          labelText: label,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget field1(Size size, String hintText, String label, IconData icon,
      TextEditingController cont) {
    return Container(
      height: size.height / 10,
      width: size.width / 1.1,
      child: TextFormField(
        controller: cont,
        obscureText: _isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffix: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              size: 25,
            ),
          ),
          hintText: hintText,
          labelText: label,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Password is required";
          } else if (_password.text.length < 6) {
            return "Password must be at least 6 characters";
          }
        },
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class LoginSuccessful extends StatelessWidget {
  const LoginSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login Successfully'),
      content: Text('Login successfully.'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBarRoots()),
            );
          },
        ),
      ],
    );
  }
}

class LoginFailed extends StatelessWidget {
  const LoginFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login Failed'),
      content: Text('Login Failed Please Enter Valid Details.'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
