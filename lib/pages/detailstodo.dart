import 'package:flutter/material.dart';

class DetailsTodo extends StatelessWidget {
  DetailsTodo({super.key, required this.mytitle, required this.mydescription});

  String mytitle;
  String mydescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(mytitle),
                Text(mydescription),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
