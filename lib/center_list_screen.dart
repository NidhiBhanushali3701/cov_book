import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CenterListScreen extends StatefulWidget {
  static String id = "CenterListScreen";
  @override
  _CenterListScreenState createState() => _CenterListScreenState();
}

class _CenterListScreenState extends State<CenterListScreen> {
  int noOfCenters = 0;
  var currentColor1 = false,
      currentColor2 = false,
      currentColor3 = false; //0 - teal //1 - tealaccent

  void share(var arg, int index) {
    Share.share(
        "${arg['ListOfCenters'][index]["vaccine"]} @ ${arg['ListOfCenters'][index]["name"]} \n${arg['ListOfCenters'][index]["address"]}");
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      noOfCenters = arguments['ListOfCenters'].length;
      print(noOfCenters);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("CoV Book"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (BuildContext context,
                      StateSetter setState /*You can rename this!*/) {
                    return Container(
                      color: Colors.white70,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "FILTERS",
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Vaccine Filter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: currentColor1
                                                ? Colors.teal
                                                : Colors.tealAccent,
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                          child: FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                currentColor1 = !currentColor1;
                                              });
                                              print("Covishield");
                                            },
                                            child: Text(
                                              "Covishield",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: currentColor2
                                                ? Colors.teal
                                                : Colors.tealAccent,
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                          child: FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                currentColor2 = !currentColor2;
                                              });
                                              print("Covaxin");
                                            },
                                            child: Text(
                                              "Covaxin",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: currentColor3
                                                ? Colors.teal
                                                : Colors.tealAccent,
                                            borderRadius:
                                                BorderRadius.circular(21),
                                          ),
                                          child: FlatButton(
                                            onPressed: () {
                                              setState(() {
                                                currentColor3 = !currentColor3;
                                              });
                                              print("Sputnik");
                                            },
                                            child: Text(
                                              "Sputnik V",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  DataTable(columns: [
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Centers',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Vaccine Name',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ], rows: []),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 12,
              child: Center(
                child: Container(
                  child: ListView.builder(
                    itemCount: noOfCenters,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return GestureDetector(
                        onLongPress: () {
                          share(arguments, index);
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  '${arguments['ListOfCenters'][index]["name"]}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 27,
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  ' ${arguments['ListOfCenters'][index]["vaccine"]}',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
