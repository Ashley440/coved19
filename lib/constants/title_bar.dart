import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  final Size preferredSize = Size.fromHeight(50.0);
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("CovED19"),
      actions: [
        FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: Text(
              "search",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
