import 'package:flutter/material.dart';
import '../../../../../core/themes/styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0), // Adds space below the title
      child: Text(
        "Log in to your account",
        style: Styles.textStyle24,
        textAlign: TextAlign.center, // Centers the text horizontally
      ),
    );
  }
}
