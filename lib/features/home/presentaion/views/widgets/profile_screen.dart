import 'package:flutter/material.dart';
import '../../../../../core/constatnts/asset_images.dart';  // Make sure the path to the assets is correct

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AssetImages.photo),
            ),
            const SizedBox(height: 20),
            const Text('User Name', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            const Text('user.email@example.com', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
