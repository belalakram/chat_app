import 'package:chat_app/features/auth/presentation/views/widgets/login_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              FirebaseAuth.instance.signOut().then((_) {
                // After successful sign-out, navigate to the SignUpView and clear the back stack
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginBody(),
                  ),
                      (route) => false, // This will clear the entire navigation stack
                );
              }).catchError((e) {
                // Display a more detailed error message in SnackBar
                String errorMessage = 'Error: $e';
                if (e is FirebaseAuthException) {
                  errorMessage = e.message ?? 'An unknown error occurred';
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(errorMessage)),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
