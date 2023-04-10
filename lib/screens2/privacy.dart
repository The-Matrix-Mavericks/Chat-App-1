import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  final String guidelines = """
This Telemedicine Privacy Policy applies to the telemedicine services, telemedicine website or mobile application (the “Telemedicine Services“) 
provided by PSYCH360, (“PSYCH360,” “we,” “us,” or “our“), as applicable.

This Telemedicine Privacy Policy applies to individually identifiable information also known as “Protected Health Information” or “PHI” that you 
provide us for purposes of obtaining medical care through the Telemedicine Services and which is subject to our Health Insurance Portability and 
Accountability Act (“HIPAA“) Notice of Privacy Practices (the “HIPAA Notice“), and to information that is not PHI. The HIPAA Notice is a separate 
document that governs how we can use and/or disclose your PHI as well as your rights with respect to PHI. 
Notice regarding your PHI, the HIPAA Notice will apply.
""";
  bool _checkBox = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7165D6),
          centerTitle: true,
          title: Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 0,
                ),
                child: Text(
                  "$guidelines",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 55),
                child: Row(
                  children: [
                    Text(
                      "Agree to Privacy Policy",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Checkbox(
                      value: _checkBox,
                      onChanged: (value) {
                        setState(() {
                          _checkBox = !_checkBox;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 40,
                    child: Material(
                      color: Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      // surfaceTintColor: Colors.black,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
