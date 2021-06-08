import 'package:flutter/material.dart';

class PinCodeScreen extends StatefulWidget {
  static String id = 'PinCodeScreen';
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      body: Container(
        child: Text("PinCode"),
      ),
    );
  }
}
