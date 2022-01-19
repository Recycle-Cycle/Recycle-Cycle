import 'package:flutter/material.dart';
import 'dart:async';

import 'package:recycle_cycle/ui/main/mainPage.dart';

//스플래시 클래스
class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    //3초 뒤에 라우트기능을 통해 메인페이지로 이동하도록
    Timer(
      Duration(milliseconds: 1500),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => mainPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //파일 전체가 컨테이너 안에 모두 맞도록 설정
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/splash_img.png"), fit: BoxFit.cover),
      ),
    );
  }
}

