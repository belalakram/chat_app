import 'package:flutter/material.dart';

import '../../../../../core/constatnts/asset_images.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        ListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(AssetImages.photo),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          title: const Text('My Status'),
          subtitle: const Text('Tap to add status update'),
          onTap: () {

          },
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Recent updates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        ListTile(
          leading: const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(AssetImages.photo),
          ),
          title: const Text('John Doe'),
          subtitle: const Text('Today, 12:30 PM'),
          onTap: () {

          },
        ),
        ListTile(
          leading: const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(AssetImages.photo),
          ),
          title: const Text('Jane Smith'),
          subtitle: const Text('Today, 11:15 AM'),
          onTap: () {
            // Logic to view status updates
          },
        ),
      ],
    );
  }
}
