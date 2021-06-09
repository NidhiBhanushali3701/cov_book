import 'package:flutter/material.dart';
import 'networking.dart';

class DistrictScreen extends StatefulWidget {
  static String id = 'DistrictScreen';
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  String districtID;
  String date = "09-06-2021";
  var dataUsingDistrict;
  var listOfCenters;

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
                      labelText: 'DISTRICT-CODE',
                      labelStyle: TextStyle(color: Colors.teal),
                      hintText: 'Enter a District Code'),
                  onChanged: (value) {
                    districtID = value;
                  },
                ),
              ),
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
                  onPressed: () async {
                    Networking networking = Networking();
                    dataUsingDistrict =
                        await networking.getDataByDistrict(districtID, date);
                    listOfCenters = dataUsingDistrict["sessions"];
                    print(listOfCenters);
                    print(listOfCenters.length);
                    var listOfCenter;
                    var noOfCenter = 0;
                    for (listOfCenter in listOfCenters) {
                      print(
                          "${listOfCenter["name"]} gives ${listOfCenter["vaccine"]}");
                    }
                  },
                  child: Text(
                    "SEARCH",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
