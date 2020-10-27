import 'package:connectivity/connectivity.dart';
import 'package:coved19/constants/helpline.dart';
import 'package:coved19/constants/loading.dart';
import 'package:coved19/constants/news_feeds.dart';
import 'package:coved19/constants/self_checker.dart';
import 'package:coved19/constants/stats_grid.dart';
import 'package:coved19/constants/title_bar.dart';
import 'package:coved19/services/helpers.dart';
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

  Future setupTables() async {
    var tables = await getTableData();
    stats.setDate(tables[2]);
    List<dynamic> casesTable =
        createProvinceStatTable(tables[1], 1, 1, tables[1].length);
    List<dynamic> deathsTable =
        createProvinceStatTable(tables[0], 1, 1, tables[0].length);
    List<dynamic> recoveriesTable =
        createProvinceStatTable(tables[0], 2, 1, tables[0].length);

    stats.setStats([[], casesTable, recoveriesTable, deathsTable]);
  }

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
      await setupTables();
      await stats.getLatestStats();
      await news.getLatestArticles();
      setState(() {
        _loadingMessage = "Finishing up";
        _loading = false;
      });
    } catch (e) {
      print(e.toString());
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
              // backgroundColor: Colors.grey[50],
              appBar: AppBar(
                elevation: 0,
                actions: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
                leading: Icon(Icons.menu),
              ),
              bottomNavigationBar: TitleBar(),
              body: TabBarView(children: [
                ListView(
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    HelpLine(),
                    stats,
                    SizedBox(
                      height: 5,
                    ),
                    SelfChecker(),
                    // HelpLine(),
                    SizedBox(
                      height: 5,
                    ),
                    news
                  ],
                ),
                InfoPage(),
              ]),
            ),
          );
  }
}
