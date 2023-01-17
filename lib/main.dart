import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/newhomepage.dart';
import 'package:mytodo/pages/addtodo.dart';
import 'package:mytodo/pages/allmytodos.dart';
import 'package:mytodo/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBQHwwIAAXwr2JfteU1SI4cD_7MTj_LkCY",
      appId: "1:612466554316:web:eefe84f43c0faf6dc85969",
      messagingSenderId: "612466554316",
      projectId: "mynotebook-c350d",
    ),
  );
  // if (Firebase.apps.isEmpty) {
  //   await Firebase.initializeApp(
  //     name: "hasannotebook",
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyBQHwwIAAXwr2JfteU1SI4cD_7MTj_LkCY",
  //       appId: "1:612466554316:web:eefe84f43c0faf6dc85969",
  //       messagingSenderId: "612466554316",
  //       projectId: "mynotebook-c350d",
  //     ),
  //   );
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
