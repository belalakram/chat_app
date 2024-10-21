import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with actual chat items count
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Example image
          ),
          title: const Text('Contact Name'),
          subtitle: const Text('Last message...'),
          trailing: const Text('12:30 PM'),
          onTap: () {
            // Open chat
          },
        );
      },
    );
  }
}
