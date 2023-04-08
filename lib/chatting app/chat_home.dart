import 'package:chat/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7165D6),
        centerTitle: true,
        leading: Icon(CupertinoIcons.chat_bubble_text_fill),
        title: Text("We Chat"),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
          //   },
          // icon: Icon(Icons.search),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF7165D6),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
