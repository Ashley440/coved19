import 'package:flutter/material.dart';

class NavigatorPane extends StatefulWidget {
  final String screenActive;

  NavigatorPane({this.screenActive});

  @override
  _NavigatorPaneState createState() => _NavigatorPaneState();
}

class _NavigatorPaneState extends State<NavigatorPane> {
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
                child: IconButton(
              icon: Icon(
                Icons.search,
                color: widget.screenActive == "search"
                    ? Colors.redAccent
                    : Colors.black,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/search"),
            )),
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.home,
                color: widget.screenActive == "home"
                    ? Colors.redAccent
                    : Colors.black,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, "/"),
            )),
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.info,
                color: widget.screenActive == "info"
                    ? Colors.redAccent
                    : Colors.black,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, "/info"),
            ))
          ],
        ),
      ),
    );
  }
}
