import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:recycle_cycle/model/trash.dart';
import 'indicatorScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Proportion extends StatefulWidget {
  const Proportion({Key? key}) : super(key: key);

  @override
  _ProportionState createState() => _ProportionState();
}

class _ProportionState extends State<Proportion> {
  List<int> types = [0, 0, 0, 0];
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
              //-------------------------
              //recycle type rate
              //-------------------------
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
                child: getData(),
              ),
              //-------------------------
              //user level
              //-------------------------
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
                    padding: const EdgeInsets.all(30), child: getInfo()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getData() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Trash').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularPercentIndicator(
              radius: 250,
              progressColor: Colors.blue,
            );
          }
          return getRate(context, snapshot.data!.docs);
        });
  }

  Widget getRate(BuildContext context, List<DocumentSnapshot> snapshot) {
    for (int i = 0; i < 4; i++) types[i] = 0;
    for (int i = 0; i < snapshot.length; i++) {
      var a = Trash.fromDocumnet(snapshot[i]);
      if (a.type == "plastic")
        types[0] += 1;
      else if (a.type == "glass")
        types[1] += 1;
      else if (a.type == "paper")
        types[2] += 1;
      else
        types[3] += 1;
    }
    return Center(
      child: Stack(
        children: [
          Indicator(percent: 1.0, color: Color(0xffec6455)),
          Indicator(
              percent: (types[2] + types[1] + types[0]) / snapshot.length,
              color: Color(0xfff4d267)),
          Indicator(
              percent: (types[1] + types[0]) / snapshot.length,
              color: Color(0xff61b0bd)),
          Indicator(
              percent: types[0] / snapshot.length, color: Color(0xff57cc4a))
        ],
      ),
    );
  }

  FutureBuilder getType() {
    CollectionReference type = FirebaseFirestore.instance.collection('Trash');

    return FutureBuilder(
        future: type.get(),
        builder: (context, snapshot) {
          return Container(child: Text('dd'));
        });
  }

  FutureBuilder getInfo() {
    DocumentReference info = FirebaseFirestore.instance
        .collection('Info')
        .doc('irpkLwivj4Mc4yP5J5lT');

    return FutureBuilder(
        future: info.get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 50,
                    percent: snapshot.data.data()['exp'] / 100,
                    progressColor: Color(0xff57cc4a),
                    backgroundColor: Color(0xffd0cece),
                    linearStrokeCap: LinearStrokeCap.butt),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Level ${snapshot.data.data()['nowLevel']}'),
                    Text('Level ${snapshot.data.data()['nextLevel']}')
                  ],
                )
              ],
            );
          }
          return Text('Loading');
        });
  }
}
