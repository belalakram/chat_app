import 'package:chat_app/features/auth/presentation/views/widgets/email_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_title.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/logo.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_row.dart';
import 'package:chat_app/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_button.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LandingScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isPasswordVisible = false;


class _LandingScreenState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 120,),
              Logo(),

              SizedBox(height: 10,),
              LoginTitle(),
              SizedBox(height: 20,),
              EmailField(emailController: emailController),
              const SizedBox(height: 15),
              PasswordField(
                passwordController: passwordController,
                isPasswordVisible: isPasswordVisible,
                toggleVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 20),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                onSuccess: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const RegisterRow(),
            ],

          ),
        ),
      ),
    );
  }


  displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}