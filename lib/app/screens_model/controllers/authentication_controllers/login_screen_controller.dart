import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/alert_box.dart';

class LoginController extends GetxController{

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final emailFocus=FocusNode().obs;
  final passwordFocus =FocusNode().obs;
  final RxBool isSeen=true.obs;

  void changeSeen(){
    isSeen.value=!isSeen.value;
}
void checkController(){
if(emailController.value.text.isEmpty||passwordController.value.text.isEmpty){
  CustomAlertBox.show('Insufficient Information', 'Please fill the require fields');
}else{
  null;
}
}

}