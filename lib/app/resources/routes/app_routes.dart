import 'package:get/get.dart';
import 'package:painting/app/resources/routes/routes_name.dart';
import 'package:painting/app/screens/authentication/forget_password_screen.dart';
import 'package:painting/app/screens/authentication/login_screen.dart';
import 'package:painting/app/screens/nav_bar_screens/customers/add_customers_screen.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/add_estimates.dart';
import 'package:painting/app/screens/nav_bar_screens/nav_bar_screen.dart';

import 'package:painting/app/screens/splash_screen.dart';

class AppRoutes{
  static appRoute()=>[
    GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RoutesName.loginScreen, page: () => const  LoginScreen(),),
    GetPage(name: RoutesName.forgetPasswordScreen, page:() => const ForgetPasswordScreen()),
    GetPage(name: RoutesName.navBarScreen, page: () => NavBarScreen(),),
    GetPage(name: RoutesName.addCustomers, page: () => AddCustomers(),),
    GetPage(name: RoutesName.addEstimates, page: () => AddEstimates(),)
  ];
}