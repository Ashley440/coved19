import 'package:coved19/models/stat_block.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  List<StatBlock> stats = [
    StatBlock(
        heading: "Tests Conducted",
        color: Colors.blueAccent,
        statIcon: Icons.assignment),
    StatBlock(
        heading: "Total Cases",
        color: Colors.amber,
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
      setState(() {
        stats[i].update(numbers);
      });
    }
  }

  @override
  void initState() {
    getLatestStats();
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
        children:
            stats.map((StatBlock statBlock) => statBlock.create()).toList());
  }
}
