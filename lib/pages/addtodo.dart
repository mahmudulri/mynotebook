import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mytodo/pages/allmytodos.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddtodoPage extends StatefulWidget {
  const AddtodoPage({super.key});

  @override
  State<AddtodoPage> createState() => _AddtodoPageState();
}

class _AddtodoPageState extends State<AddtodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String type = "";
  String category = "";

  final _titleKey = GlobalKey<FormState>();
  // final _descriptionKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("My NoteBook"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => AllTodosPage());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Browse all"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            // title(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Form(
              key: _titleKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task Title",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter Title",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        return null;
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Task Description",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 155,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter Description",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        return null;
                      },
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: InputBorder.none,
                        errorMaxLines: null,
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),

            Text(
              "Task Type",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              children: [
                taskSelect("Important", 0xff2464fa),
                SizedBox(
                  width: 10,
                ),
                taskSelect("Normal", 0xff2ba8d9),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),

            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Wrap(
              children: [
                categorySelect("Food", 0xff2464fa),
                SizedBox(
                  width: 10,
                ),
                categorySelect("Workout", 0xfff29732),
                SizedBox(
                  width: 10,
                ),
                categorySelect("Work", 0xff2ba8d9),
                SizedBox(
                  width: 10,
                ),
                categorySelect("Design", 0xff2ba8d9),
                SizedBox(
                  width: 10,
                ),
                categorySelect("Run", 0xff2ba8d9),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (_titleKey.currentState!.validate()) {
                    print("object");
                  }
                  FirebaseFirestore.instance.collection("hasannotebook").add({
                    "title": titleController.text,
                    "task": type,
                    "description": descriptionController.text,
                    "category": category,
                  }).whenComplete(() {
                    print("added data");
                    titleController.clear();
                    descriptionController.clear();
                    Get.to(() => AllTodosPage());
                  });
                });
              },
              child: Container(
                height: 50,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "ADD NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taskSelect(String label, int mcolor) {
    return InkWell(
      onTap: () {
        setState(() {
          type = label;
        });
      },
      child: Chip(
        backgroundColor: type == label ? Colors.black : Color(mcolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    );
  }

  Widget categorySelect(String label, int mcolor) {
    return InkWell(
      onTap: () {
        setState(() {
          category = label;
        });
      },
      child: Chip(
        backgroundColor: category == label ? Colors.black : Color(mcolor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
    );
  }

  // Widget title() {
  //   var screenwidth = MediaQuery.of(context).size.width;
  //   return Container(
  //     height: 55,
  //     width: screenwidth,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: Colors.grey,
  //     ),
  //     child: Form(
  //       key: _titleKey,
  //       child: TextFormField(
  //         validator: (value) {
  //           if (value == null || value.isEmpty) {
  //             Fluttertoast.showToast(
  //                 msg: "Enter Title",
  //                 toastLength: Toast.LENGTH_SHORT,
  //                 gravity: ToastGravity.BOTTOM,
  //                 timeInSecForIosWeb: 1,
  //                 textColor: Colors.white,
  //                 fontSize: 16.0);
  //           }
  //           return null;
  //         },
  //         controller: titleController,
  //         decoration: InputDecoration(
  //           hintText: "Title",
  //           border: InputBorder.none,
  //           contentPadding: EdgeInsets.only(left: 20),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget description() {
  //   var screenwidth = MediaQuery.of(context).size.width;
  //   return Container(
  //     height: 150,
  //     width: screenwidth,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(15),
  //       color: Colors.grey,
  //     ),
  //     child: Form(
  //       key: _descriptionKey,
  //       child: TextFormField(
  //         validator: (value) {
  //           if (value == null || value.isEmpty) {
  //             Fluttertoast.showToast(
  //                 msg: "Enter Description",
  //                 toastLength: Toast.LENGTH_SHORT,
  //                 gravity: ToastGravity.BOTTOM,
  //                 timeInSecForIosWeb: 1,
  //                 textColor: Colors.white,
  //                 fontSize: 16.0);
  //           }
  //           return null;
  //         },
  //         controller: descriptionController,
  //         decoration: InputDecoration(
  //           hintText: "Description",
  //           border: InputBorder.none,
  //           errorMaxLines: null,
  //           contentPadding: EdgeInsets.only(left: 20),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
