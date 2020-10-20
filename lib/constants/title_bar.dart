import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  final Size preferredSize = Size.fromHeight(75.0);
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(
            text: "home",
            icon: Icon(
              Icons.home,
            ),
          ),
          Tab(
            text: "info",
            icon: Icon(
              Icons.info,
            ),
          ),
        ],
      ),
    );
  }
}
