import 'package:flutter/material.dart';
import 'pincode_screen.dart';
import 'district_screen.dart';

class StartApp extends StatelessWidget {
  static String id = 'StartApp';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 48,
                  width: 237,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(21),),
                  child: TextButton(
                    onPressed: () {
                      print("find by pincode");
                      Navigator.pushNamed(context, PinCodeScreen.id);
                    },
                    child: Text("Find By Pin-Code",style: TextStyle(color: Colors.white, fontSize: 25),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 48,
                  width: 237,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(21),),
                  child: TextButton(
                    onPressed: () {
                      print("find by district");
                      Navigator.pushNamed(context, DistrictScreen.id);
                    },
                    child: Text("Find By District",style: TextStyle(color: Colors.white, fontSize: 25),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
