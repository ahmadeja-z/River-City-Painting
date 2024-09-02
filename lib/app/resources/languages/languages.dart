import 'package:get/get.dart';

class Languages extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en_US':{
//loginScreen
    'loginStatement':'Login to your Account',
      'email':'Email',
      'password':'Password',
      'forgetPassword':'Forget Password?  ',
      'signIn':'Sign In',
      //ForgetScreen
      'forgetStatement':'Forgot Your Password ?',
      'explanation':'Please enter the email associated with\n your account and we\'ll send an email with\n link, where you can change your password.',
      'send':'Send',
      'loginHere':'Login here !'

    }
  };

}