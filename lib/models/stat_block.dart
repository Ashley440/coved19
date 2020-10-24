import 'package:coved19/models/province.dart';
import 'package:coved19/views/stats.dart';
import 'package:flutter/material.dart';

class StatBlock {
  final String heading;
  final Color color;
  final IconData statIcon;
  String _date = "";
  String _numbers = "";
  List<Province> stats;

  StatBlock({this.heading, this.color, this.statIcon});

  void update(String n) {
    _numbers = n;
  }

  void setDate(String d) {
    _date = d;
  }

  void setStatsPageData(List<Province> newStats) {
    stats = newStats;
  }

  Widget create(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StatsPage(
                    pageName: "$heading as of $_date",
                    color: color,
                    data: stats,
                  ))),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 5), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              statIcon,
              color: color,
              size: 48,
            ),
            SizedBox(height: 10),
            Text(
              _numbers,
              style: TextStyle(
                  fontSize: 24,
                  color: color,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              heading,
              style: TextStyle(fontSize: 16, color: color),
            )
          ],
        ),
      ),
    );
  }
}
