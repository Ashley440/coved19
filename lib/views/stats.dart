import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  final String pageName;

  StatsPage(this.pageName);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("This is the ${widget.pageName} page")),
    );
  }
}
