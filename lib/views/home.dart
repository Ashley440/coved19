import 'package:connectivity/connectivity.dart';
import 'package:coved19/constants/loading.dart';
import 'package:coved19/constants/navigator.dart';
import 'package:coved19/constants/news_feeds.dart';
import 'package:coved19/constants/stats_grid.dart';
import 'package:coved19/constants/title_bar.dart';
import 'package:coved19/views/info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  String _loadingMessage = "setting things up";
  NewsFeeds news = NewsFeeds();
  StatsGrid stats = StatsGrid();

  Future setupData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      setState(() {
        _loadingMessage = "please enable internet connection";
      });
      return;
    }
    setState(() {
      _loadingMessage = "Getting necessary data";
    });
    try {
      await stats.getLatestStats();
      await news.getLatestArticles();
      setState(() {
        _loadingMessage = "Finishing up";
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loadingMessage = "Could not get data. Check internet connection";
      });
    }
  }

  @override
  void initState() {
    setupData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? LoadingScreen(
            loadingMessage: _loadingMessage,
          )
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.grey[50],
              appBar: TitleBar(),
              body: TabBarView(children: [
                ListView(
                  children: [
                    stats,
                    SizedBox(
                      height: 20,
                    ),
                    news
                  ],
                ),
                InfoPage(),
              ]),
              // bottomNavigationBar: NavigatorPane(
              //   screenActive: "home",
              // ),
            ),
          );
  }
}
