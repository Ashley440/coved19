import 'package:coved19/constants/navigator.dart';
import 'package:coved19/constants/news_feeds.dart';
import 'package:coved19/constants/stats_grid.dart';
import 'package:coved19/constants/title_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: TitleBar(),
      body: ListView(
        children: [
          StatsGrid(),
          SizedBox(
            height: 20,
          ),
          NewsFeeds()
        ],
      ),
      bottomNavigationBar: NavigatorPane(
        screenActive: "home",
      ),
    );
  }
}
