import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Indicator extends StatefulWidget {
  Indicator({Key? key, required this.percent, required this.color});

  final double percent;
  final Color color;

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 1000,
      lineWidth: 25,
      percent: widget.percent,
      progressColor: widget.color,
      backgroundColor: Colors.transparent,
      radius: 250,
    );
  }
}
