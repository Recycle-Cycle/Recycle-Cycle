import 'package:flutter/material.dart';
import 'cardScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'proportion/proportionPage.dart';

//앱의 첫번째 페이지
class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0x00000000)),
      debugShowCheckedModeBanner: false,
      //배경 이미지 설정-----------------------
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/main_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //상단 타이틀---------------------------------------
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                width: size.width * 0.25,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/title_white.png"),
                      fit: BoxFit.fitHeight),
                ),
              ),
              //카드뷰(레벨트리 나오는)-------------------------------
              cardScreen(),
              //첫번째 버튼----------------------------------------
              Container(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Classify'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 4.0),
                ),
              ),
              //두번째 버튼-------------------------------
              Container(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Recycled List',
                      style: TextStyle(color: Colors.grey)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 4.0),
                ),
              ),
              //세번째 버튼-----------------------------
              Container(
                margin: EdgeInsets.only(bottom: 30),
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Proportion()));
                  },
                  child:
                      Text('Proportion', style: TextStyle(color: Colors.grey)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 4.0),
                ),
              ),
            ],
          )),
    );
  }
}
