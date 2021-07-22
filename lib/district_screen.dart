import 'package:cov_book/center_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'networking.dart';

class DistrictScreen extends StatefulWidget {
  static String id = 'DistrictScreen';
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  var dataUsingDistrict;
  var listOfCenters, listOfStates, listOfDistricts;
  var selectedState = 0, selectedDistrict;
  List<DropdownMenuItem> states, districts = [];
  bool showProgressBar = false;

  @override
  void initState() {
    super.initState();
    selectedDistrict = selectedState = 0;
  }

  Future<dynamic> getDistricts(var districtSelected) async {
    Networking networking = Networking();
    var decodeData = await networking.getDistricts(districtSelected.toString());
    var listOfDistricts = decodeData["districts"];
    districts = [];
    districts.insert(
      0,
      DropdownMenuItem(
        child: Text(
          "Select a District",
        ),
        value: 0,
      ),
    );
    for (var district in listOfDistricts) {
      //print("${district["district_name"]}>>${district["district_id"]}");
      districts.add(
        DropdownMenuItem(
          child: Text(
            district["district_name"],
          ),
          value: district["district_id"],
        ),
      );
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      states = arguments["states"];
    }
    return ModalProgressHUD(
      inAsyncCall: showProgressBar,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "CoV Book",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child: Form(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: selectedState,
                                      hint: Text("Select a State"),
                                      items: states,
                                      onChanged: (value) async {
                                        selectedDistrict = 0;
                                        //print("${states[selectedState].value},#$selectedState");
                                        setState(() {
                                          //print("state selected $selectedState & value $value");
                                          selectedState = value;
                                          showProgressBar = true;
                                          districts = [];
                                        });
                                        //print("${states[selectedState].value},#$selectedState");
                                        //print("i have selected index ${states[selectedState].child.toString()}");
                                        await getDistricts(selectedState);
                                        setState(() {
                                          showProgressBar = false;
                                        });
                                        //print("my dis are ${districts[0].child},${districts.length}");
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Center(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: selectedDistrict,
                                      hint: Text("Select a District"),
                                      items: districts,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedDistrict = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        if ((selectedState != 0 && selectedDistrict != 0) ||
                            (selectedState != null &&
                                selectedDistrict != null)) {
                          Networking networking = Networking();
                          dataUsingDistrict = await networking
                              .getDataByDistrict(selectedDistrict.toString());
                          listOfCenters = dataUsingDistrict["sessions"];
                          print(listOfCenters);
                          Navigator.pushNamed(
                            context,
                            CenterListScreen.id,
                            arguments: {'ListOfCenters': listOfCenters},
                          );
                        } else {
                          print("Select valid state & district");
                        }
                      },
                      child: Text(
                        "SEARCH",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
