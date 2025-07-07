import 'package:chatapp/models/Message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, message) async {
    final String senderID = _auth.currentUser!.uid!;
    final String senderEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message msg = Message(
      senderID: senderID,
      senderEmail: senderEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [senderID, receiverID];

    ids.sort();
    String chatRoomID = ids.join("_");

    _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(msg.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];

    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
