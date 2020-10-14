import 'package:flutter/material.dart';

class StatBlock {
  final String heading;
  final Color color;
  final IconData statIcon;
  String _numbers = "";

  StatBlock({this.heading, this.color, this.statIcon});

  void update(String n) {
    _numbers = n;
  }

  Widget create() {
    return Container(
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
    );
  }
}
