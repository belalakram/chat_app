// // lib/services/firestore_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../message.dart';
// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   // Send a message to Firestore
//   Future<void> sendMessage(String chatRoomId, Message message) async {
//     try {
//       await _db.collection('chat_rooms')
//           .doc(chatRoomId)
//           .collection('messages')
//           .add(message.toMap());  // Use toMap() to convert the Message to a Map
//     } catch (e) {
//       print("Error sending message: $e");
//     }
//   }
//
//   // Get messages for a chat room
//   Stream<List<Message>> getMessages(String chatRoomId) {
//     return _db.collection('chat_rooms')
//         .doc(chatRoomId)
//         .collection('messages')
//         .orderBy('timestamp')
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//         .map((doc) => Message.fromMap(doc.data() as Map<String, dynamic>))
//         .toList());
//   }
// }
