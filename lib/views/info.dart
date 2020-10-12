import 'package:coved19/constants/navigator.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CovED19")),
      ),
      body: Center(child: Text("This is the info page")),
      bottomNavigationBar: NavigatorPane(),
    );
  }
}
