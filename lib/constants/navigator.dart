import 'package:flutter/material.dart';

class NavigatorPane extends StatefulWidget {
  final String screenActive;

  NavigatorPane({this.screenActive});

  @override
  _NavigatorPaneState createState() => _NavigatorPaneState();
}

class _NavigatorPaneState extends State<NavigatorPane> {
  Color isActive(String screenName) {
    return widget.screenActive == screenName ? Colors.redAccent : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
        child: Row(
          children: [
            Expanded(
                child: FlatButton.icon(
              icon: Icon(
                Icons.home,
                color: isActive("home"),
                size: 24,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, "/"),
              label: Text("home",
                  style: TextStyle(color: isActive("home"), fontSize: 20)),
            )),
            Expanded(
                child: FlatButton.icon(
              icon: Icon(
                Icons.info,
                color: isActive("info"),
                size: 24,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, "/info"),
              label: Text("info",
                  style: TextStyle(color: isActive("info"), fontSize: 20)),
            ))
          ],
        ),
      ),
    );
  }
}
