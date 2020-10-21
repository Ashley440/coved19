import 'package:charts_flutter/flutter.dart';
import 'package:coved19/models/province.dart';
import 'package:flutter/material.dart';

class StatsPieChart extends StatelessWidget {
  /// Create one series with sample hard coded data.
  static List<Series<Province, String>> _createSampleData() {
    final data = [
      new Province(name: "WC", stats: 106184),
      new Province(name: "EC", stats: 86927),
      new Province(name: "NC", stats: 16933),
      new Province(name: "FS", stats: 36702),
      new Province(name: "GT", stats: 204424),
      new Province(name: "LP", stats: 15759),
    ];

    return [
      new Series<Province, String>(
        id: 'Active Cases',
        colorFn: (_, __) => MaterialPalette.green.shadeDefault,
        domainFn: (Province p, int _) => p.name,
        measureFn: (Province p, _) => p.stats,
        data: data,
        // Set a label accessor to control the text of the arc label.
        // labelAccessorFn: (Province row, _) => '${row.name}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      height: screenSize.height * .6,
      child: BarChart(
        _createSampleData(),
        animate: true,
      ),
    );
  }
}
