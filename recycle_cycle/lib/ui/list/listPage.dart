import 'package:flutter/material.dart';

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
                height: 300,
                margin: const EdgeInsets.all(20),
              )

            ],
          ),
        ),
      ),
    );
  }
}
