import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/constatnts/asset_images.dart';
import '../../../../auth/presentation/views/widgets/login_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller and animation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900), // Change to milliseconds
    );

    animation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });

    animationController?.repeat(reverse: true);

    // Timer to navigate to the next screen after 5 seconds
    Timer(const Duration(seconds: 3), goToNext);
  }

  void goToNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginBody()),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the screen is disposed
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FadeTransition(
        opacity: animation!,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and App name
              Image.asset(AssetImages.logo, height: size.height * 0.2),
              SizedBox(height: 10,),
              Text("WhatsUP",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Text("The best chat app for this centry",style: TextStyle(color: Color(0XFF25D366)),)



            ],
          ),
        ),
        
      ),
    );
  }
}
