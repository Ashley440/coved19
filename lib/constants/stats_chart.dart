import 'package:charts_flutter/flutter.dart';
import 'package:coved19/models/province.dart';
import 'package:flutter/material.dart';

class StatsChart extends StatelessWidget {
  final dynamic chartBackground;
  final List<Province> data;

  StatsChart({this.chartBackground, this.data});

  /// Create one series with sample hard coded data.
  List<Series<Province, String>> _setupData() {
    return [
      new Series<Province, String>(
        id: 'Active Cases',
        colorFn: (_, __) => MaterialPalette.white,
        domainFn: (Province p, int _) => p.name,
        measureFn: (Province p, _) => p.stats,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: chartBackground,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      height: screenSize.height * .6,
      child: BarChart(
        _setupData(),
        animate: true,
        domainAxis: OrdinalAxisSpec(
            renderSpec: SmallTickRendererSpec(
                labelRotation: 60,
                labelStyle: TextStyleSpec(color: Color.white))),
        primaryMeasureAxis: NumericAxisSpec(
            renderSpec: SmallTickRendererSpec(
                labelStyle: TextStyleSpec(color: Color.white))),
      ),
    );
  }
}
