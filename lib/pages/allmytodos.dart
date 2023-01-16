import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/pages/detailstodo.dart';

class AllTodosPage extends StatefulWidget {
  const AllTodosPage({super.key});

  @override
  State<AllTodosPage> createState() => _AllTodosPageState();
}

class _AllTodosPageState extends State<AllTodosPage> {
  // final Stream<QuerySnapshot> _stream =
  //     FirebaseFirestore.instance.collection("hasannotebook").snapshots();

  // var myid = FirebaseFirestore.instance.collection("hasannotebook").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "My NoteBook",
          style: TextStyle(fontSize: 18, color: Colors.white38),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("hasanbook").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Some error");
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data"));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<QueryDocumentSnapshot<Object?>> _todo = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: _todo.map((todo) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: ListTile(
                      // leading: Text(Index).toString(),
                      title: Text("${todo["title"]}"),
                      subtitle: todo["description"].toString().length > 20
                          ? Text(
                              "${todo["description"].toString().substring(0, 25)}...")
                          : Text("${todo["description"]}"),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            deleteTodo(todo.id);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future deleteTodo(id) async {
    CollectionReference notelist =
        FirebaseFirestore.instance.collection("hasanbook");

    notelist
        .doc(id)
        .delete()
        .then((value) => print("deleted"))
        .catchError((error) => print("my error : $error"));
  }
}
