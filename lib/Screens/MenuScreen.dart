import 'package:chat/chatBot/bot.dart';
import 'package:chat/main.dart';
import 'package:chat/showProfile.dart/showProfile.dart';
import 'package:flutter/material.dart';

import '../Authenticate/Methods.dart';
import 'HomeScreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    WelcomePage(),
    HomeScreen(),
    ShowProfile(
      email: "",
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bottom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_2),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("        Welcome Screen"),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                size: MediaQuery.of(context).size.height / 28.0,
              ),
              onPressed: () => logOut(context))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[800]!,
              Colors.blue[600]!,
              Colors.blue[400]!,
              Colors.blue[200]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Telemedicine App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'A new way to connect with doctors',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Image.network(
              'https://imgs.search.brave.com/UajdDrAp64TURngCXUucaHkSEGqSKaDSzvKdd8gcwNA/rs:fit:659:530:1/g:ce/aHR0cHM6Ly93d3cu/c3BvdG5yaWRlcy5j/b20vdWJlci14L3Vi/ZXItZG9jdG9yL3Bh/dGllbnRzX2FwcC5w/bmc',
              height: 200,
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bot(),
                  ),
                ); // Navigate to next page
              },
              child: Text(
                'Your assitant doctor',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.pink,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
