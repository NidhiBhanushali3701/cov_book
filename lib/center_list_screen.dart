import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CenterListScreen extends StatefulWidget {
  static String id = "CenterListScreen";
  @override
  _CenterListScreenState createState() => _CenterListScreenState();
}

class _CenterListScreenState extends State<CenterListScreen> {
  int noOfCenters = 0;

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
