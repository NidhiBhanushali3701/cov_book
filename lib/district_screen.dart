import 'package:flutter/material.dart';

class DistrictScreen extends StatefulWidget {
  static String id = 'DistrictScreen';
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
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
