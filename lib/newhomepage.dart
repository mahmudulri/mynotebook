import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/mylogic.dart';

class NewHomepage extends StatefulWidget {
  NewHomepage({super.key});

  @override
  State<NewHomepage> createState() => _NewHomepageState();
}

class _NewHomepageState extends State<NewHomepage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController villageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  static bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("my note book"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.grey,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Name",
                    ),
                  ),
                  TextField(
                    controller: villageController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Village",
                    ),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Number",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // MyLogics().sendDatatoDB(nameController.text,
                              //     villageController.text, phoneController.text);
                              AddCategory().setCategory();
                            });
                          },
                          child: Text("Add"),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Update"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                // color: Colors.green,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("data"),
                          Text("data"),
                          Text("data"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
