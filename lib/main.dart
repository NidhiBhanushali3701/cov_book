import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'district_screen.dart';
import 'pincode_screen.dart';
import 'start_screen.dart';
import 'center_list_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartApp.id,
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
        CenterListScreen.id: (context) {
          return CenterListScreen();
        },
      },
    ),
  );
}
