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
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      body: Container(
        child: Text("District"),
      ),
    );
  }
}
