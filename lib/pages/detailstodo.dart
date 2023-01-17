import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsTodo extends StatelessWidget {
  DetailsTodo({super.key, required this.mytitle, required this.mydescription});

  String mytitle;
  String mydescription;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: screenHeight * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mytitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  mydescription,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: mydescription));
                        Fluttertoast.showToast(
                            msg: "Copied Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Icon(Icons.copy),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        await Share.share(mydescription);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Icon(Icons.share),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
