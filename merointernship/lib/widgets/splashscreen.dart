import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../screens/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: MainScreen(),
        duration: 3000,
        imageSize: 250,
        imageSrc: "merointernshiplogo.jpg",
      ),
    );
  }
}
