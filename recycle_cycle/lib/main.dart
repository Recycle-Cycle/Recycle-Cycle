import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_cycle/ui/splashScreen.dart';

//비동기 처리 위해 main async로 수행
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //flutter코어엔진 초기화
  await Firebase.initializeApp(); //파베 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'recycleCycle';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      //디버깅 배너 삭제
      debugShowCheckedModeBanner: false,
      home: splashPage(),
    );
  }
}

//첫화면->스플래시화면 나오도록
class splashPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return splashScreen();
  }
}