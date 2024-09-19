import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/utils/alert_box.dart';

class ForgetPasswordController extends GetxController{

  final emailController=TextEditingController().obs;

  void checkController(){
    if(emailController.value.text.isEmpty){
      CustomAlertBox.show('Insufficient data', 'Fill all the fields');
    }else{
      null;
    }
  }

}