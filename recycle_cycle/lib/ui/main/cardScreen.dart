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
    //Size size = MediaQuery.of(context).size;
    return Card(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.white,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: _levelUp(context),
            );
  }
}

Widget _levelUp(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
        //firestore 스트림 형성(스냅샷 & 개수 반환)
        stream: FirebaseFirestore.instance
            .collection('Trash')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _getCnt(context, snapshot.data!.docs.length);

  });
}

// 분리수거 양에 따른 단계 변화 설정 (이미지)
Widget _getCnt(BuildContext context, int a) {
  final cntTrash = a;
  String imageloads = "assets/tree1.png";
  Size size = MediaQuery.of(context).size;

  if (cntTrash>= 0 && cntTrash < 5) imageloads;
  else if ( cntTrash>=5 && cntTrash < 10) imageloads = "assets/tree2.png";
  else if ( cntTrash>=10 && cntTrash < 15) imageloads = "assets/tree3.png";
  else if ( cntTrash>=15 && cntTrash < 20) imageloads = "assets/tree4.png";
  else imageloads = "assets/tree5.png";

  return Container( 
    width: size.width * 0.8,
    height: size.height * 0.5,
    padding: EdgeInsets.all(50),
    decoration: BoxDecoration(
      image: DecorationImage(
      //조건문에 따른 이미지 변경 필요
        image: AssetImage(imageloads),
        fit: BoxFit.cover,
      ),
    ),
  );
}

