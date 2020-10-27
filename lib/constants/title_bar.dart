import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget implements PreferredSizeWidget {
  final Size preferredSize = Size.fromHeight(75.0);
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          icon: Icon(
            Icons.home,
          ),
          text: "home",
        ),
        Tab(
          icon: Icon(
            Icons.info,
          ),
          text: "info",
        ),
      ],
      labelColor: Colors.red,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5),
      indicatorColor: Colors.red,
    );
  }
}
