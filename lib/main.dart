import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/app_colors/app_colors.dart';
import 'package:painting/app/resources/languages/languages.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/estimates_info_views/files_info_estimates.dart';
import 'package:painting/app/screens/nav_bar_screens/estimates/estimates_info_views/photos_info_estimates_view.dart';
import 'package:painting/app/screens/splash_screen.dart';
import 'app/resources/routes/app_routes.dart';
import 'app/screens/nav_bar_screens/estimates/estimates_info_tabs_screen.dart';
import 'app/screens/nav_bar_screens/estimates/estimates_info_views/items/add_items_container.dart';
import 'app/screens/nav_bar_screens/estimates/estimates_info_views/items/items_tabs_info_estimates.dart';
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
// home: FilesTabsInfoEstimates ()
      getPages: AppRoutes.appRoute(),
    );

  }
}

