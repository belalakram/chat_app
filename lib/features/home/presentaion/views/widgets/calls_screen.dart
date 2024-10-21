import 'package:flutter/material.dart';
import '../../../../../core/constatnts/asset_images.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(AssetImages.photo), // Corrected to AssetImage
          ),
          title: const Text('John Doe'),
          subtitle: Row(
            children: const [
              Icon(Icons.call_missed, color: Colors.red, size: 16),
              SizedBox(width: 5),
              Text('Yesterday, 10:30 AM'),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () {

            },
          ),
          onTap: () {

          },
        ),
        // Example Call 2 (Outgoing Call)
        ListTile(
          leading: const CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Placeholder profile picture
            ),
          ),
          title: const Text('Jane Smith'),
          subtitle: Row(
            children: const [
              Icon(Icons.call_made, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text('Today, 9:00 AM'),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () {

            },
          ),
          onTap: () {

          },
        ),
        // Example Call 3 (Video Call)
        ListTile(
          leading: const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(AssetImages.photo),
          ),
          title: const Text('Michael Johnson'),
          subtitle: Row(
            children: const [
              Icon(Icons.videocam, color: Colors.blue, size: 16),
              SizedBox(width: 5),
              Text('Today, 8:00 AM'),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.videocam, color: Colors.blue),
            onPressed: () {

            },
          ),
          onTap: () {

          },
        ),
      ],
    );
  }
}
