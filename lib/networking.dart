import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

const String apiURL =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/";

class Networking {
  var decodeData;
  static String date;

  void getDate() {
    var dateTime = DateTime.now();
    date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }

  Future<dynamic> getDataByPincode(String pincode) async {
    getDate();
    Http.Response response = await Http.get(
        "${apiURL}findByPin?pincode=$pincode&date=$date"); //date=31-03-2021

    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      return decodeData;
    } else {
      print("Error!");
    }
  }

  Future<dynamic> getDataByDistrict(String districtID) async {
    getDate();
    Http.Response response = await Http.get(
        "${apiURL}findByDistrict?district_id=$districtID&date=$date"); //date=31-03-2021
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      return decodeData;
    } else {
      print("Error!");
    }
  }

  Future<dynamic> getDataByLocation(String lat, String lon) async {
    getDate();
    Http.Response response =
        await Http.get("$apiURL/findByLatLong?lat=$lat&long=$lon");
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      print(decodeData);
    } else {
      print("Error");
    }
  }

  Future<dynamic> getStates() async {
    Http.Response response = await Http.get(
        "https://cdn-api.co-vin.in/api/v2/admin/location/states");
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      //print(decodeData);
      return decodeData;
    } else {
      print("Error!");
      return;
    }
  }

  Future<dynamic> getDistricts(String stateID) async {
    Http.Response response = await Http.get(
        "https://cdn-api.co-vin.in/api/v2/admin/location/districts/$stateID");
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
      print(decodeData);
      return decodeData;
    } else {
      print("Error");
      return;
    }
  }
}
