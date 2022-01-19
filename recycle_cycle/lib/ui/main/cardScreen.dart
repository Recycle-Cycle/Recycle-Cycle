import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class cardScreen extends StatefulWidget {
  const cardScreen({ Key? key }) : super(key: key);

  @override
  _cardScreenState createState() => _cardScreenState();
}

class _cardScreenState extends State<cardScreen> {
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.white,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container( 
                width: size.width * 0.8,
                height: size.height * 0.5,
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //조건문에 따른 이미지 변경 필요
                    image: AssetImage("assets/tree1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
  }
}

// firestore 이미지 스냅샷 & 개수 반환 함수
// void _getCnt(int a) {
//   FirebaseFirestore.instance
//     .collection('Trash')
//     .get()
//     .then((snapShot) {
//       a = snapShot.docs.length;
//   });
  
// }

