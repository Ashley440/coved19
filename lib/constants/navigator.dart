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
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: screenSize.height * .1,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
        child: TabBar(
          tabs: [
            Tab(
              text: "home",
              icon: Icon(
                Icons.home,
                color: isActive("home"),
                size: 24,
              ),
            ),
            Tab(
              text: "info",
              icon: Icon(
                Icons.info,
                color: isActive("info"),
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
