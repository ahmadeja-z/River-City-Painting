import 'dart:async';

import 'package:get/get.dart';
import 'package:painting/app/resources/routes/routes_name.dart';

class SplashServices{
  static void isLogin(){
    Timer(const Duration(seconds: 3),(){
      Get.toNamed(RoutesName.loginScreen);
    });

  }
}