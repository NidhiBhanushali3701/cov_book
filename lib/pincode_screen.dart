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
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(),
            SizedBox(
              height: 30,
            ),
            MaterialButton(onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
