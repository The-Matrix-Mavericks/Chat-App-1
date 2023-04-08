import 'package:chat/Authenticate/Autheticate.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: 2,
        screen: MainScreen(),
        nextScreen: Authenticate(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  // Duration of the splash screen
  final int duration;

  // Widget to be displayed as the splash screen
  final Widget screen;

  // Widget to be displayed after the splash screen
  final Widget nextScreen;

  SplashScreen({
    Key? key,
    required this.duration,
    required this.screen,
    required this.nextScreen,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after the duration of the splash screen
    Future.delayed(Duration(seconds: widget.duration)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the splash screen background to your desired image or color
        color: Colors.white,
        child: Center(
          child: widget.screen,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            SizedBox(height: 50.0),
            Text(
              'Welcome to TeleMed App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
