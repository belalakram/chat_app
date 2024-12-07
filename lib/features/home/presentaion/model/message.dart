// // lib/models/message.dart
// class Message {
//   final String senderId;
//   final String text;
//   final DateTime timestamp;
//
//   Message({required this.senderId, required this.text, required this.timestamp});
//
//   // To convert message to a Map for Firebase Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'senderId': senderId,
//       'text': text,
//       'timestamp': timestamp,
//     };
//   }
//
//   // To create a Message object from a Map
//   factory Message.fromMap(Map<String, dynamic> map) {
//     return Message(
//       senderId: map['senderId'],
//       text: map['text'],
//       timestamp: (map['timestamp'] as Timestamp).toDate(),
//     );
//   }
// }
