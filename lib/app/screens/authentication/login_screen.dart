import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/customized_button.dart';
import 'package:painting/app/resources/components/customized_textField.dart';
import 'package:painting/app/resources/routes/routes_name.dart';

import '../../resources/app_colors/app_colors.dart';
import '../../controllers/authentication_controllers/login_screen_controller.dart';
import '../nav_bar_screens/nav_bar_screen.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.15,
            ),
            Image.asset(AppImages.appLogo),
            SizedBox(
              height: Get.height * 0.15,
            ),
            Text(
              'loginStatement'.tr,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: AppFonts.poppinsRegular,
                  fontSize: 24),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomizedTextField(
              controller: loginController.emailController.value,
              nextFocus: loginController.passwordFocus.value,
              currentFocus: loginController.emailFocus.value,
              hintText: 'email'.tr,
              inputText: TextInputType.emailAddress,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
           Obx(() =>  CustomizedTextField(
             isSeen: loginController.isSeen.value,
             controller: loginController.passwordController.value,
             currentFocus: loginController.passwordFocus.value,
             suffixClick: (){loginController.changeSeen();},
             suffixIcon:loginController.isSeen.value?const Icon(CupertinoIcons.eye):const Icon(CupertinoIcons.eye_slash) ,
             hintText: 'password'.tr,

           ),),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(onTap: (){Get.toNamed(RoutesName.forgetPasswordScreen);},
              child: Text('forgetPassword'.tr,style: const TextStyle(color: AppColors.primaryRed,fontFamily: AppFonts.interRegular,fontSize: 14),),
              ),
            ), SizedBox(
              height: Get.height * 0.03,
            ),

            CustomizedButton(
              onPress: (){
                loginController.checkController();
                Get.to(NavBarScreen());
              },
              title: 'Login',

            ),
      SizedBox(
        height: Get.height*0.09,
      ),
            Image.asset(AppImages.lowerCornerIcon)

          ],
        ),
      ),
    );
  }
}
