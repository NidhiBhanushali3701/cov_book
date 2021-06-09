import 'package:flutter/material.dart';

class CenterListScreen extends StatefulWidget {
  @override
  _CenterListScreenState createState() => _CenterListScreenState();
}

class _CenterListScreenState extends State<CenterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
