import 'package:coved19/popups/self_checker_form.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelfChecker extends StatefulWidget {
  @override
  _SelfCheckerState createState() => _SelfCheckerState();
}

class _SelfCheckerState extends State<SelfChecker> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: screenSize.height * .3,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Want to know your covid19 status?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              icon: Icon(Icons.assignment, color: Colors.blue),
              color: Colors.white,
              onPressed: () => showDialog(
                context: context,
                builder: (context) => SelfCheckerForm(),
              ),
              label: Text(
                "check",
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            )
          ],
        ));
  }
}
