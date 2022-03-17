import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CenterListScreen extends StatefulWidget {
  static String id = "CenterListScreen";
  @override
  _CenterListScreenState createState() => _CenterListScreenState();
}

class _CenterListScreenState extends State<CenterListScreen> {
  int noOfCenters = 0;
  var currentFilter1 = false,
      currentFilter2 = false,
      currentFilter3 = false; //false - teal && true - tealAccent
  var args = [], arg1 = [], arg2 = [], arg3 = [];

  void filter(var arguments) {
    arg1 = arg2 = arg3 = [];
    args = arguments['ListOfCenters'];
    for (var arg in arguments['ListOfCenters']) {
      if (arg['vaccine'] == "COVISHIELD") {
        arg1.add(arg);
      } else if (arg['vaccine'] == "COVAXIN") {
        arg2.add(arg);
      } else if (arg['vaccine'] == "SPUTNIK V") {
        arg3.add(arg);
      }
    }
  }

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
      filter(arguments);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("CoV Book"),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.filter_alt_outlined,
        //     ),
        //     onPressed: () {
        //       showModalBottomSheet(
        //         context: context,
        //         builder: (context) {
        //           return StatefulBuilder(builder: (BuildContext context,
        //               StateSetter setState /*You can rename this!*/) {
        //             return Container(
        //               color: Colors.white70,
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(30),
        //                 ),
        //                 child: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: Column(
        //                     children: [
        //                       Text(
        //                         "FILTERS",
        //                         style: TextStyle(
        //                           color: Colors.teal,
        //                           fontSize: 25,
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 20,
        //                       ),
        //                       Text(
        //                         "Vaccine Filter",
        //                         style: TextStyle(
        //                           color: Colors.black,
        //                           fontSize: 25,
        //                         ),
        //                       ),
        //                       Expanded(
        //                         child: Padding(
        //                           padding: const EdgeInsets.all(8.0),
        //                           child: Row(
        //                             children: [
        //                               Expanded(
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     color: currentFilter1
        //                                         ? Colors.teal
        //                                         : Colors.tealAccent,
        //                                     borderRadius:
        //                                         BorderRadius.circular(21),
        //                                   ),
        //                                   child: FlatButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         currentFilter1 =
        //                                             !currentFilter1;
        //                                         args = arg1;
        //                                       });
        //                                     },
        //                                     child: Text(
        //                                       "Covishield",
        //                                       style: TextStyle(
        //                                         color: currentFilter1
        //                                             ? Colors.white
        //                                             : Colors.teal,
        //                                         fontSize: 15,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: 20,
        //                               ),
        //                               Expanded(
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     color: currentFilter2
        //                                         ? Colors.teal
        //                                         : Colors.tealAccent,
        //                                     borderRadius:
        //                                         BorderRadius.circular(21),
        //                                   ),
        //                                   child: FlatButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         currentFilter2 =
        //                                             !currentFilter2;
        //                                         args = arg2;
        //                                       });
        //                                     },
        //                                     child: Text(
        //                                       "Covaxin",
        //                                       style: TextStyle(
        //                                         color: currentFilter2
        //                                             ? Colors.white
        //                                             : Colors.teal,
        //                                         fontSize: 15,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: 20,
        //                               ),
        //                               Expanded(
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     color: currentFilter3
        //                                         ? Colors.teal
        //                                         : Colors.tealAccent,
        //                                     borderRadius:
        //                                         BorderRadius.circular(21),
        //                                   ),
        //                                   child: FlatButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         currentFilter3 =
        //                                             !currentFilter3;
        //                                         args = arg3;
        //                                       });
        //                                     },
        //                                     child: Text(
        //                                       "Sputnik V",
        //                                       style: TextStyle(
        //                                         color: currentFilter3
        //                                             ? Colors.white
        //                                             : Colors.teal,
        //                                         fontSize: 15,
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                       Container(
        //                         decoration: BoxDecoration(
        //                           color: Colors.teal,
        //                           borderRadius: BorderRadius.circular(21),
        //                         ),
        //                         child: IconButton(
        //                           onPressed: () {
        //                             Navigator.pop(context);
        //                             //setState((){});
        //                           },
        //                           icon: Icon(
        //                             Icons.find_replace_outlined,
        //                           ),
        //
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //           });
        //         },
        //       );
        //     },
        //   ),
        // ],
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
                    itemCount: args.length, //noOfCenters,
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
                                  '${args[index]["name"]}', //'${arguments['ListOfCenters'][index]["name"]}',
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
                                  ' ${args[index]["vaccine"]}', //' ${arguments['ListOfCenters'][index]["vaccine"]}',
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
