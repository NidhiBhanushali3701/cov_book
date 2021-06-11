import 'package:cov_book/center_list_screen.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

class DistrictScreen extends StatefulWidget {
  static String id = 'DistrictScreen';
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  String districtID;
  var dataUsingDistrict;
  var listOfCenters;
  var listOfStates, listOfDistricts;
  List<DropdownMenuItem> states, districts = List<DropdownMenuItem>();

  @override
  void initState(){
    super.initState();
    print("states \n$states");
    print("districts \n$districts");
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      print("states \n${arguments["states"]}");
      print("districts \n${arguments["districts"]}");
      states = arguments["states"];
      districts = arguments["districts"];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "CoV Book",
        ),
        centerTitle: true,
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
                        borderSide: BorderSide(color: Colors.teal),
                      ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: DropdownButton(
                              items: states,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              items: districts,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        await networking.getDataByDistrict(districtID);
                    listOfCenters = dataUsingDistrict["sessions"];
                    print(listOfCenters);
                    Navigator.pushNamed(
                      context,
                      CenterListScreen.id,
                      arguments: {'ListOfCenters': listOfCenters},
                    );
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
