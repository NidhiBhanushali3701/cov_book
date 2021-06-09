import 'package:cov_book/center_list_screen.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

class PinCodeScreen extends StatefulWidget {
  static String id = 'PinCodeScreen';
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String pincode;
  var dataUsingPincode;
  var listOfCenters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text("CoV Book"),
        ),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: TextField(
                  textAlign: TextAlign.justify,
                  // ignore: missing_return
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: 'PIN-CODE',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Enter a PinCode'),
                  onChanged: (value) {
                    pincode = value;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                  padding:
                      EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
                  child: null),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 48,
                width: 237,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: TextButton(
                    child: Text(
                      'SEARCH',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () async {
                      Networking networking = Networking();
                      dataUsingPincode =
                          await networking.getDataByPincode(pincode);
                      var noOfCenter = 0;
                      print(dataUsingPincode);
                      listOfCenters = dataUsingPincode["sessions"];
                      var listOfCenter;
                      for (listOfCenter in listOfCenters) {
                        print(++noOfCenter);
                        print(
                            "${listOfCenter["name"]} gives ${listOfCenter["vaccine"]}");
                      }
                      Navigator.pushNamed(context, CenterListScreen.id,
                          arguments: {'ListOfCenters': listOfCenters});
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
