import 'package:flutter/cupertino.dart';

class Utils{

  static changeFocus(BuildContext context,FocusNode currentFocus,FocusNode nextNode){
    currentFocus.unfocus();
FocusScope.of(context).requestFocus(nextNode);
  }

}