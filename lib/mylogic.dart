import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/mycontroller.dart';

DataController themeDataController = Get.put(DataController());

class MyLogics {
  sendDatatoDB(String name, String village, String number) async {
    CollectionReference _courses =
        FirebaseFirestore.instance.collection("alldatabase");

    try {
      _courses.doc("Group-1").set({
        "name": name,
        "phone": village,
        "number": number,
      }).whenComplete(() {
        print("data added ");
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
