import 'package:flutter/material.dart';

import '../../../../../core/themes/styles.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Log in to your account",
      style: Styles.textStyle24,
    );
  }
}
