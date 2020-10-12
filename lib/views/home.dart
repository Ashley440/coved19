import 'package:coved19/constants/navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CovED19")),
      ),
      body: Center(
        child: Text("this is the home page"),
      ),
      bottomNavigationBar: NavigatorPane(
        screenActive: "home",
      ),
    );
  }
}
