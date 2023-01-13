import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            Text("Task Title"),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            title(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text("Task Type"),
            SizedBox(
              height: screenHeight * 0.02,
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
              height: screenHeight * 0.02,
            ),
            Text("Task Description"),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            description(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text("Categories"),
            SizedBox(
              height: screenHeight * 0.02,
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
              height: screenHeight * 0.08,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  FirebaseFirestore.instance.collection("hasannotebook").add({
                    "title": titleController.text,
                    "task": type,
                    "description": descriptionController.text,
                    "category": category,
                  }).whenComplete(() {
                    titleController.clear();
                    descriptionController.clear();
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

  Widget title() {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 55,
      width: screenwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      child: TextFormField(
        controller: titleController,
        decoration: InputDecoration(
          hintText: "Title",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20),
        ),
      ),
    );
  }

  Widget description() {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: screenwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      child: TextFormField(
        controller: descriptionController,
        decoration: InputDecoration(
          hintText: "Description",
          border: InputBorder.none,
          errorMaxLines: null,
          contentPadding: EdgeInsets.only(left: 20),
        ),
      ),
    );
  }
}
