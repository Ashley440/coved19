import 'package:coved19/popups/self_checker_form.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelfChecker extends StatefulWidget {
  @override
  _SelfCheckerState createState() => _SelfCheckerState();
}

class _SelfCheckerState extends State<SelfChecker> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => SelfCheckerForm(),
      ),
      child: Card(
        elevation: 1,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check your covid status",
                        // softWrap: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Try our self covid19 checker",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white)
              ],
            )),
      ),
    );
  }
}
