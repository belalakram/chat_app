import 'package:chat_app/core/shared_widgets/dafault_text.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return defaultText(
      type: TextInputType.emailAddress,
      controller: emailController,
      label: 'Enter your email',
      hint: 'Your email',
      prefix: Icons.email,
      validate: (value) {
        if (value == null || value.isEmpty) {
          return 'Email must not be empty';
        }
        // Basic email format validation (can be improved further if needed)
        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
          return 'Enter a valid email address';
        }
        return null;
      },
    );
  }
}
