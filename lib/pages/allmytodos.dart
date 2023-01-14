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
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("hasannotebook").snapshots();

  // var myid = FirebaseFirestore.instance.collection("hasannotebook").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos"),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> document =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailsTodo(
                          mytitle: document["title"],
                          mydescription: document["description"],
                        ));
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document["title"],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          document["category"],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   FirebaseFirestore.instance
                                    //       .collection("hasannotebook")
                                    //       .doc(widget.id)
                                    //       .delete()
                                    //       .then((value)({
                                    //         print("Deleted")
                                    //       }));
                                    // });
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red.shade300,
                                  ),
                                ),
                              ],
                            ),
                            // Text(
                            //   document["description"],
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                // return TodoCard(
                //   title: document["title"],
                //   time: "10.22",
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
