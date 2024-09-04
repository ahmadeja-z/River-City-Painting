import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/languages/languages.dart';
import 'app/screens/nav_bar_screens/dashboard/schedules_view.dart';
import 'app/screens/nav_bar_screens/nav_bar_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'River City Painting',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
      ),
locale:const Locale('en','US') ,
translations: Languages(),
home: NavBarScreen(),
//       getPages: AppRoutes.appRoute(),
    );
  }
}

