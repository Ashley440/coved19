import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String loadingMessage;

  LoadingScreen({this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: screenSize.height,
            width: double.infinity,
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CovED 19",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Text(
                  loadingMessage,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            )));
  }
}
