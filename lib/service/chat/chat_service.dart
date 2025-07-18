import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test6_26/models/message.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiverID, String message) async {
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    //创造新消息
    Message newMessage = Message(
      senderID: currentUserId,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );
    //将消息添加到数据库
    List<String> ids = [currentUserId, receiverID];
    ids.sort();
    String chatId = ids.join('_');
    await _firestore
        .collection("chat_rooms")
        .doc(chatId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //取出消息
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatId)
        .collection("messages")
        .orderBy("timestamp",descending: false)
        .snapshots();
  }
}
