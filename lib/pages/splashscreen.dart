import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytodo/pages/addtodo.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isvisible = false;
  int mypass = 989898;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Hi, mahmudul",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Enter password to access your NoteBook",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: 200,
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value != mypass.toString()) {
                                return "enter password";
                              }
                              return null;
                            },
                            obscureText: isvisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              border: InputBorder.none,
                              hintText: "password",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                          child: Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.black,
            //     shape: BoxShape.circle,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         if (_formkey.currentState!.validate()) {
            //           Get.to(() => AddtodoPage());
            //         }
            //       });
            //     },
            //     child: Icon(
            //       Icons.arrow_forward,
            //       size: 70,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_formkey.currentState!.validate()) {
                    Get.to(() => AddtodoPage());
                  }
                });
              },
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                    depth: 8,
                    lightSource: LightSource.topLeft,
                    color: Colors.grey),
                child: Icon(
                  Icons.arrow_forward,
                  size: 70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
