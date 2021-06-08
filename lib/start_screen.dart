import 'package:flutter/material.dart';
import 'pincode_screen.dart';
import 'district_screen.dart';

class StartApp extends StatelessWidget {
  static String id = 'StartApp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          child: Center(
            child: Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 250,
                        child: MaterialButton(
                          onPressed: () {
                            print("find by pincode");
                            Navigator.pushNamed(context, PinCodeScreen.id);
                          },
                          color: Colors.blueGrey,
                          child: Text("Find By Pin-Code"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        child: MaterialButton(
                          onPressed: () {
                            print("find by district");
                            Navigator.pushNamed(context, DistrictScreen.id);
                          },
                          color: Colors.blueGrey,
                          child: Text("Find By District"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
