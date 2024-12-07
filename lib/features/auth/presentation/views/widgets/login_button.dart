import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/shared_widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSuccess;

  const LoginButton({
    required this.emailController,
    required this.passwordController,
    required this.onSuccess,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Log In',
      func: () {
        // Validate email
        if (emailController.text.isEmpty || !RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)) {
          displayToastMssg('Please enter a valid email address.', context);
        }
        // Validate password
        else if (passwordController.text.isEmpty) {
          displayToastMssg('Password is mandatory.', context);
        }
        // If both validations pass, proceed with the login
        else {
          onSuccess();
        }
      },
    );
  }
}

// Function to display toast messages
void displayToastMssg(String msg, BuildContext context) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM, // Adjust the position of the toast message
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
