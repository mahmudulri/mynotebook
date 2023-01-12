import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descripController = TextEditingController();

  TextEditingController catController = TextEditingController();

  bool isLoading = false;

  List mytodos = [];

  Future<void> createTodos(
      String title, String description, String categories) async {
    setState(() {
      isLoading = true;
    });
    CollectionReference mydata = FirebaseFirestore.instance.collection('todo');

    try {
      return mydata.add({
        "title": title,
        "description": description,
        "categories": categories,
      }).then((value) {
        print("added successfully");
        setState(() {
          isLoading = false;
          titleController.clear();
          descripController.clear();
          catController.clear();
        });
      });
    } catch (err) {
      print("error : $err");
    }
  }

  Future<void> getTodos() async {
    CollectionReference _todos = FirebaseFirestore.instance.collection("todo");
    FirebaseFirestore.instance
        .collection('todo')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        mytodos = querySnapshot.docs;
        // print("object  $mytodos");
      });
    });
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

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
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter title",
                    ),
                  ),
                  TextField(
                    controller: descripController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Enter Description",
                    ),
                  ),
                  TextField(
                    controller: catController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Categories",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  createTodos(
                                      titleController.text,
                                      descripController.text,
                                      catController.text);

                                  getTodos();
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
                  itemCount: mytodos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${mytodos[index]["title"]}"),
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
