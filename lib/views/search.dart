import 'package:coved19/constants/navigator.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CovED19")),
      ),
      body: Center(child: Text("This is the search page")),
      bottomNavigationBar: NavigatorPane(
        screenActive: "search",
      ),
    );
  }
}
