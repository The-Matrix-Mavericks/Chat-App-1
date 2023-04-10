import 'package:flutter/material.dart';

class Medicalform extends StatelessWidget {
  const Medicalform({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  final List<String> _gender = ['Male', 'Felmale', 'Other'];
  var _fromGender = 'Male';
  final List<String> _injury = ['Yes', 'No'];
  var _fromInjury = 'Yes';
  // int lines = 4;

  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _bmiController = TextEditingController();
  final _weightController = TextEditingController();
  final _currMCController = TextEditingController();
  final _currMCController1 = TextEditingController();
  final _currMCController2 = TextEditingController();
  final _currMCController3 = TextEditingController();
  final _currMCController4 = TextEditingController();
  final _currMCController5 = TextEditingController();
  final _surgController = TextEditingController();
  final _medicInsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Color(0xFF7165D6),
        title: const Center(
          child: Text(
            "Medical Record of Patient",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            // ),
            // Text(
            //   "Fill the form",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your full name'),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 27,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                      // backgroundColor: Color.fromARGB(255, 126, 206, 237),
                      // fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  items: _gender
                      .map((String value) => DropdownMenuItem<String>(
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromGender = value!;
                    });
                  },
                  value: _fromGender,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter your age'),
                controller: _ageController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Height',
                    hintText: 'Enter your height in cm'),
                controller: _heightController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight',
                    hintText: 'Enter your weight in kg'),
                controller: _weightController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'BMI',
                    hintText: 'Enter your BMI'),
                controller: _bmiController,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              width: 27,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, top: 0),
              child: Text(
                'Any Current Medical complications or enjuries?',
                style: TextStyle(
                  // backgroundColor: Color.fromARGB(255, 126, 206, 237),
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton(
              items: _injury
                  .map((String value) => DropdownMenuItem<String>(
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromInjury = value!;
                });
              },
              value: _fromInjury,
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Describe the current medical condition\nif any?',
                  // hintText:
                  // 'Write about the medical condition facing currently....'
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                // controller: _bmiController,
                maxLines: 4,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'Describe medical issues like asthma,\nepilopsy, diabetes etc. .... if any?',
                  // hintText:
                  // 'Write about the medical issues '
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'Describe the current mental condition like \nanxiety or depression if any?',
                  // hintText:
                  // 'Write about the medical condition facing currently....'
                ),
              ),
            ),

            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'Describe any kind of allergies with \nmedicines if any?',
                  // hintText:
                  // 'Write about the medical condition facing currently....'
                ),
              ),
            ),

            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),

              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                maxLines: 4,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      'Describe any kind of allergies with \nfood itens or insects if any?',
                  // hintText:
                  // 'Write about the medical condition facing currently....'
                ),
                // controller: _currMCController5,
              ),
            ),
            SizedBox(
              height: 30,
            ),

            SizedBox(
              width: 27,
            ),
            Text(
              'Any surgeries had before?',
              style: TextStyle(
                  // backgroundColor: Color.fromARGB(255, 126, 206, 237),
                  // fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton(
              items: _injury
                  .map((String value) => DropdownMenuItem<String>(
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromInjury = value!;
                });
              },
              value: _fromInjury,
            ),

            Text(
              'Do you have medical insurance?',
              style: TextStyle(
                  // backgroundColor: Color.fromARGB(255, 126, 206, 237),
                  // fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton(
              items: _injury
                  .map((String value) => DropdownMenuItem<String>(
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _fromInjury = value!;
                });
              },
              value: _fromInjury,
            ),
          ],
        ),
      ),
    );
  }
}
