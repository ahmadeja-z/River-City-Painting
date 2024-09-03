import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/languages/languages.dart';
import 'package:painting/app/resources/routes/app_routes.dart';

import 'app/practise.dart';
import 'app/screens/nav_bar_screens/dashboard/dashboard_view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
locale:const Locale('en','US') ,
translations: Languages(),
home: NavBarScreen(),
//       getPages: AppRoutes.appRoute(),
    );
  }
}

