import 'package:expence_app/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          lineTouchData: LineTouchData(enabled: true),
          lineBarsData: [
            LineChartBarData(
              show: true,
              spots: [
                FlSpot(0, 0),
                FlSpot(2, 3),
                FlSpot(3, 8),
                FlSpot(4, 6),
                FlSpot(5, 8),
                FlSpot(6, 4),
                FlSpot(7, 10),
                FlSpot(8, 2),
                FlSpot(10, 1),
              ],
              isCurved: true,
              dotData: FlDotData(show: false),
              barWidth: 6,
              color: kMainColor,

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [kMainColor.withAlpha(200), kMainColor.withAlpha(10)],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: AxisTitles(drawBelowEverything: false),
            rightTitles: AxisTitles(drawBelowEverything: false),
            leftTitles: AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(axisNameWidget: Text("data")),
          ),
          borderData: FlBorderData(show: false),
          maxX: 10,
          minX: 0,
          maxY: 12,
          minY: 0,
        ),
      ),
    );
  }
}
