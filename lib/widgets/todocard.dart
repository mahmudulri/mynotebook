import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  TodoCard({super.key, required this.title, required this.time});

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 75,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Spacer(),
            Text(time),
          ],
        ),
      ),
    );
  }
}
