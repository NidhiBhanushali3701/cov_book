import 'package:cov_book/center_list_screen.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

class DistrictScreen extends StatefulWidget {
  static String id = 'DistrictScreen';
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  var dataUsingDistrict;
  var listOfCenters, listOfStates, listOfDistricts;
  var selectedState, selectedDistrict;
  List<DropdownMenuItem> states, districts = [];

  @override
  void initState() {
    super.initState();
    print("states \n$states");
    print("districts \n$districts");
    selectedDistrict = selectedState = 0;
  }

  Future<dynamic> getDistricts(var districtSelected) async {
    Networking networking = Networking();
    var decodeData = await networking.getDistricts(districtSelected.toString());
    var listOfDistricts = decodeData["districts"];
    var district;
    for (district in listOfDistricts) {
      districts.add(
        DropdownMenuItem(
          child: Text(district["district_name"]),
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
    return Scaffold(
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
                                    items: arguments["states"],
                                    onChanged: (value) {
                                      //async {
                                      setState(() {
                                        selectedState = value;
                                      });
                                      //await getDistricts(selectedState);
                                      districts.insert(
                                        0,
                                        DropdownMenuItem(
                                          child: Text("Select a District"),
                                          value: 0,
                                        ),
                                      );
                                      getDistricts(selectedState);
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
                                  child: DropdownButtonFormField(
                                    value: selectedDistrict,
                                    hint: Text("Select a District"),
                                    items: arguments["districts"],
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
                      if (selectedState != 0 && selectedDistrict != 0) {
                        Networking networking = Networking();
                        dataUsingDistrict =
                            await networking.getDataByDistrict(selectedDistrict);
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
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
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
