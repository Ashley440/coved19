import 'package:coved19/constants/stats_chart.dart';
import 'package:coved19/models/province.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  final String pageName;
  final Color color;
  final List<Province> data;

  StatsPage({this.pageName, this.color, this.data});

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  Widget tableRow(String province, int stat) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]))),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            province,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ))),
          Expanded(
            child: Center(
                child: Text(
              stat.toString(),
              style: TextStyle(fontSize: 18),
            )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
      ),
      backgroundColor: widget.color,
      body: widget.data.length == 0
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oops!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 96,
                          fontWeight: FontWeight.bold)),
                  Text(
                    "Couldn't get anything for this page.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  StatsChart(
                    chartBackground: widget.color,
                    data: widget.data,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 17.0, horizontal: 12),
                            child: Center(
                                child: Text(
                              "${widget.pageName}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        for (Province province in widget.data)
                          tableRow(province.name, province.stats)
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
