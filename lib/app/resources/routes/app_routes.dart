import 'package:get/get.dart';
import 'package:painting/app/resources/routes/routes_name.dart';
import 'package:painting/app/screens/authentication/forget_password_screen.dart';
import 'package:painting/app/screens/authentication/login_screen.dart';

import 'package:painting/app/screens/splash_screen.dart';

class AppRoutes{
  static appRoute()=>[
    GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RoutesName.loginScreen, page: () => const  LoginScreen(),),
    GetPage(name: RoutesName.forgetPasswordScreen, page:() => const ForgetPasswordScreen())
  ];
}