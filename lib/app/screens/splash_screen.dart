import 'package:flutter/material.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/screens_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    SplashServices.isLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppImages.upperCornerIcon),
          Image.asset(AppImages.appLogo),
          Image.asset(AppImages.lowerCornerIcon)
        ],
      ),
    );
  }
}
