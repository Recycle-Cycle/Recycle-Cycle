import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'indicatorScreen.dart';

class Proportion extends StatefulWidget {
  const Proportion({Key? key}) : super(key: key);

  @override
  _ProportionState createState() => _ProportionState();
}

class _ProportionState extends State<Proportion> {
  double rate = 0.7;
  int now = 0;
  int next = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey[700],
                      size: 30,
                    )),
              ),
              Text(
                'Proportion',
                style: TextStyle(color: const Color(0xff1ea271), fontSize: 30),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(10, 30, 0, 10),
                child: Text(
                  'What kind of recycle?',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 80,
                child: Center(
                    child: Stack(
                  children: [
                    Indicator(percent: 1.0, color: Color(0xffec6455)),
                    Indicator(percent: 0.9, color: Color(0xfff4d267)),
                    Indicator(percent: 0.75, color: Color(0xff61b0bd)),
                    Indicator(percent: 0.6, color: Color(0xff57cc4a)),
                  ],
                )),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(10, 30, 0, 10),
                child: Text(
                  'My Level?',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 50,
                          percent: rate,
                          progressColor: Color(0xff57cc4a),
                          backgroundColor: Color(0xffd0cece),
                          linearStrokeCap: LinearStrokeCap.butt),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Level $now'), Text('Level $next')],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
