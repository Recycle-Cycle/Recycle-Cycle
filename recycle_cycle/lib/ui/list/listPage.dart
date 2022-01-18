import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_cycle/model/trash.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            children: [
              // 뒤로가기 버튼
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

              // 페이지 이름
              Text(
                'Recylced List',
                style: TextStyle(color: const Color(0xff1ea271), fontSize: 30),
              ),

              // 리스트뷰
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 550,
                margin: const EdgeInsets.all(20),
                child: _buildBody(context),
              )

            ],
          ),
        ),
      ),
    );
  }
}

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //동적 데이터 활용을 위해 스트림 형성
        stream: FirebaseFirestore.instance
            .collection('Trash')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          return _buildList(context, snapshot.data!.docs); //리스트뷰 생성 함수(생성자) 호출
        });
  }

    //쿼리문 스냅샷 문서를 인자로 갖고 리스트뷰를 반환하는 함수
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: snapshot
          .map((data) => _buildListItem(context, data))
          .toList(), //문서마다 리스트뷰_타일 생성 함수(생성자) 호출
    ));
  }

    //각 문서의 데이터를 인자로 갖고 리스트뷰_타일(각 사각항목)을 반환하는 함수
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final currTrash = Trash.fromDocumnet(data);

    // 아이콘 색깔 지정
    Color currColor = new Color(0xffffffff);
    if (currTrash.type == "plastic") currColor = new Color(0xff5abc7f);
    else if (currTrash.type == "glass") currColor = new Color(0xff61b0bd);
    else if (currTrash.type == "paper") currColor = new Color(0xfff4d267);
    else currColor = new Color(0xffec6455); //metal

    // datetime 파싱
    DateTime currTime = currTrash.timestamp.toDate();
    String timeString = currTime.month.toString() + "-" + currTime.day.toString() + " " + currTime.hour.toString() + ":" + currTime.minute.toString();

    // 리스트뷰 한 칸 꾸미기
    return Container(
      height: 50,
      decoration: BoxDecoration(
           border: Border(
              bottom: BorderSide(width: 1.0, color: new Color(0xffafabab)),
           )),
      child: Row(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),

          Icon(Icons.circle, color: currColor, size: 8),

          Text(currTrash.type),

          SizedBox(width: 100),

          Text(timeString, style: TextStyle( color: new Color(0xffafabab))),

          SizedBox(width: 10),
        ],
      ),
    );
    }
