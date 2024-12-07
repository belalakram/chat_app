import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting timestamps

class ChatDetailScreen extends StatefulWidget {
  final String contactEmail;

  const ChatDetailScreen({super.key, required this.contactEmail});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to send message
  void _sendMessage() async {
    String messageText = _controller.text;
    if (messageText.isNotEmpty) {
      String currentUserEmail = FirebaseAuth.instance.currentUser?.email ?? ''; // Fetch current user's email dynamically

      // Send message to Firestore under the chat collection
      await _firestore.collection('chats').add({
        'sender': currentUserEmail,
        'receiver': widget.contactEmail,
        'message': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _controller.clear(); // Clear the message input
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentUserEmail = FirebaseAuth.instance.currentUser?.email ?? ''; // Fetch current user's email dynamically

    return Scaffold(
      appBar: AppBar(title: Text('Chat with ${widget.contactEmail}')),
      body: Column(
        children: [
          // Display chat messages
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .where('sender', isEqualTo: currentUserEmail)
                  .where('receiver', isEqualTo: widget.contactEmail)
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No messages yet.'));
                }

                var messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index]['message'];
                    var sender = messages[index]['sender'];
                    var timestamp = messages[index]['timestamp'].toDate();
                    String formattedTime = DateFormat('hh:mm a').format(timestamp);

                    return ListTile(
                      title: Align(
                        alignment: sender == currentUserEmail
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: sender == currentUserEmail
                                ? Colors.blue
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message,
                            style: TextStyle(
                              color: sender == currentUserEmail
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      subtitle: Align(
                        alignment: sender == currentUserEmail
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          'From: $sender at $formattedTime',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
