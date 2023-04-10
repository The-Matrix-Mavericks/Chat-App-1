import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<AboutUsScreen> {
  // bool _checkBox = false;
  final String about =
      "We are a team of dedicated and \n entusiastic developers with great skills ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7165D6),
          centerTitle: true,
          title: Text(
            "About Us",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "images/about_us-removebg-preview.png",
                scale: 1.5,
                // height: 360,
                // width: 220,
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 20,
              //     // top: 20,
              //     right: 20,
              //     bottom: 0,
              //   ),
              //   child: Center(
              //     child: Text(
              //       "THE MATRIX MAVERICKS",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 30, right: 0),
                child: Row(
                  children: [
                    Text(
                      """We are a team of dedicated and \nentusiastic developers with great \nskills having interest in Flutter UI \ndevelopment with competency to \nbuild fully functional apps with \nbackend connetivity and attractive \nUI. """,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    // Checkbox(
                    //   value: _checkBox,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _checkBox = !_checkBox;
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: SizedBox(
              //       width: MediaQuery.of(context).size.width / 4,
              //       height: 40,
              //       child: Material(
              //         color: Color(0xFF7165D6),
              //         borderRadius: BorderRadius.circular(10),
              //         // surfaceTintColor: Colors.black,
              //         child: InkWell(
              //           onTap: () {
              //             // Navigator.push(
              //             //     context,
              //             //     MaterialPageRoute(
              //             //         builder: (context) => LoginScreen1()));
              //           },
              //           child: Padding(
              //             padding:
              //                 EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              //             child: Center(
              //               child: Text(
              //                 "Done",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 25,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Team Members : ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Yogesh Kumar Soni",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Lalit Thakre",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Arpit Patel",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Lucky Darvai",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Anushka Sen",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
