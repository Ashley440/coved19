import 'package:coved19/models/province.dart';
import 'package:coved19/models/stat_block.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

// ignore: must_be_immutable
class StatsGrid extends StatefulWidget {
  List<StatBlock> stats = [
    StatBlock(
        heading: "Tests Conducted",
        color: Colors.blueAccent,
        statIcon: Icons.assignment),
    StatBlock(
        heading: "Total Cases",
        color: Colors.orange,
        statIcon: Icons.people_alt_outlined),
    StatBlock(
        heading: "Recoveries",
        color: Colors.green,
        statIcon: Icons.favorite_outline),
    StatBlock(heading: "Deaths", color: Colors.red, statIcon: Icons.warning),
  ];

  Future<void> getLatestStats() async {
    String link = "https://sacoronavirus.co.za";
    var response = await http.get(link);
    dom.Document doc = parser.parse(response.body);

    for (int i = 0; i < stats.length; i++) {
      String numbers = doc
          .getElementsByClassName("counter-box-container")[i]
          .getElementsByClassName("display-counter")[0]
          .attributes["data-value"];
      stats[i].update(numbers);
    }
  }

  void setStats(List<List<Province>> newStats) {
    for (int i = 0; i < stats.length; i++)
      stats[i].setStatsPageData(newStats[i]);
  }

  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  @override
  void initState() {
    setState(() {
      widget.stats = widget.stats;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.all(5),
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: widget.stats
            .map((StatBlock statBlock) => statBlock.create(context))
            .toList());
  }
}
