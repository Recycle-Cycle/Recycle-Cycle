import 'package:cloud_firestore/cloud_firestore.dart';

class Trash {
  // 필드
  String type;
  Timestamp timestamp;

  // 생성자
  Trash({
    required this.type,
    required this.timestamp,
  });

  // firebase docs를 매개변수로 받아서 새로운 Trash 객체를 반환하는 메서드
  factory Trash.fromDocumnet(DocumentSnapshot doc) {
    Map? getDocs = doc.data() as Map?;
    return Trash(
      type: getDocs!["type"],
      timestamp: getDocs["timestamp"],
    );
  }
}