import 'package:auth_flow/pages/auth/loginScreen.dart';
import 'package:auth_flow/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void splashLoader() async {
    await Future.delayed(const Duration(seconds: 3));

    _firebaseAuth.currentUser != null
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    splashLoader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('assets/image/bg_img.svg'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: LoadingAnimationWidget.inkDrop(
                  size: 100,
                  color: const Color(0xffBB84E8),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
