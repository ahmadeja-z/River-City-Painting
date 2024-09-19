import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/assets/app_fonts.dart';
import 'package:painting/app/resources/assets/app_images.dart';
import 'package:painting/app/resources/components/customized_button.dart';
import 'package:painting/app/resources/components/customized_textField.dart';
import 'package:painting/app/resources/routes/routes_name.dart';
import 'package:painting/app/controllers/authentication_controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.15,
              ),
              Image.asset(AppImages.appLogo),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Text(
                'forgetStatement'.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: AppFonts.poppinsRegular,
                    fontSize: 24),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                'explanation'.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: AppFonts.poppinsRegular,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              CustomizedTextField(
                controller: forgetPasswordController.emailController.value,
                hintText: 'email'.tr,
                inputText: TextInputType.emailAddress,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomizedButton(
                onPress: () {
                  forgetPasswordController.checkController();
                },
                title: 'send'.tr,
              ),
              SizedBox(
                height: Get.height * 0.05,
                width: 250,
                child: const Divider(
                  color: Color(0xFF615858),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.loginScreen);
                },
                child: Text(
                  'loginHere'.tr,
                  style: const TextStyle(
                      fontFamily: AppFonts.poppinsRegular,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(AppImages.lowerCornerIcon)),
            ],
          ),
        ),
      ),
    );
  }
}
