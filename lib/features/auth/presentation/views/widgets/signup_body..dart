import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/dafault_text.dart';
import '../../../../../core/themes/styles.dart';
import '../../../../home/presentaion/views/home_view.dart';
import '../login_view.dart';
import 'logo.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  // Controllers initialized here
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPasswordVisible = false;
  bool? currentValue;
  double passwordStrength = 0.0; // Added password strength tracking

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose the controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  // Function to calculate password strength (dummy example)
  void checkPasswordStrength(String password) {
    setState(() {
      if (password.length < 6) {
        passwordStrength = 0.2;
      } else if (password.length < 8) {
        passwordStrength = 0.4;
      } else if (password.length < 10) {
        passwordStrength = 0.6;
      } else {
        passwordStrength = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: const Logo(),
                ),
                const SizedBox(height: 10),
                Text(
                  'Register To New Account',
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                defaultText(
                  type: TextInputType.text,
                  controller: nameController,
                  label: 'Enter your name',
                  hint: 'Your name',
                  prefix: Icons.person,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Enter your email',
                  hint: 'Your email',
                  prefix: Icons.email,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.phone,
                  controller: phoneController,
                  label: 'Enter your phone',
                  hint: 'Your phone',
                  prefix: Icons.phone_android_rounded,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Phone must not be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15.0),
                defaultText(
                  type: TextInputType.visiblePassword,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password is too short';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hint: 'Password',
                  label: 'Enter your password',
                  prefix: Icons.lock,
                  suffix: isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  pressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  onChange: (value) {
                    checkPasswordStrength(value);
                  },
                  isObscure: !isPasswordVisible,
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: passwordStrength,
                  color: passwordStrength >= 0.7 ? Colors.green : Colors.orange,
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  text: 'Sign Up',
                  func: () {
                    if (nameController.text.length < 4) {
                      displayToastMssg(
                          'Name must be at least 4 characters', context);
                    } else if (!emailController.text.contains('@')) {
                      displayToastMssg(
                          'Email address isn\'t valid', context);
                    } else if (phoneController.text.isEmpty) {
                      displayToastMssg('Phone number is mandatory', context);
                    } else if (passwordController.text.length < 8) {
                      displayToastMssg(
                          'Password must be at least 8 characters', context);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Toast message function
  void displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
