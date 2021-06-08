import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'district_screen.dart';
import 'pincode_screen.dart';
import 'start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        StartApp.id: (context) {
          return StartApp();
        },
        PinCodeScreen.id: (context) {
          return PinCodeScreen();
        },
        DistrictScreen.id: (context) {
          return DistrictScreen();
        },
      },
    ),
  );
}
