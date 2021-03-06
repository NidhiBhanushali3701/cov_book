import 'package:flutter/material.dart';
import 'pincode_screen.dart';
import 'district_screen.dart';
import 'networking.dart';

class StartApp extends StatefulWidget {
  static String id = "StartAppScreen";
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  List<DropdownMenuItem> states = [];

  Future<dynamic> getStates() async {
    Networking networking = Networking();
    var decodeData = await networking.getStates();
    var listOfStates = decodeData["states"];
    var state;
    for (state in listOfStates) {
      if (states.length < 38) {
        //print(state);
        states.add(
          DropdownMenuItem(
            child: Text(state["state_name"]),
            value: state["state_id"],
          ),
        );
      } else {
        break;
      }
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    states = [];
    states.insert(
      0,
      DropdownMenuItem(
        child: Text("Select a State"),
        value: 0,
      ),
    );
    getStates();
    //print("all states are $states ---- in start screen");
  }

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
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 100, top: 50),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "images/icon.png",
                          height: 140,
                          width: 140,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 48,
                    width: 237,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: TextButton(
                      onPressed: () {
                        print("find by pincode");
                        Navigator.pushNamed(context, PinCodeScreen.id);
                      },
                      child: Text(
                        "Find By Pin-Code",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 48,
                    width: 237,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        await getStates();
                        print("find by district -> states.length = ${states.length}");
                        Navigator.pushNamed(
                          context,
                          DistrictScreen.id,
                          arguments: {
                            "states": states,
                          },
                        );
                      },
                      child: Text(
                        "Find By District",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
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
