import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/contacts_estimates_info_tile.dart';
import 'package:painting/app/resources/components/nav_bar_screens_widgets/estimates_header_container.dart';

class ContactsEstimatesInfoController extends GetxController {
  // Simulating a list of contacts data
  var contactsList = [
    {
      'title': 'Title Here',
      'name': 'Name Here',
      'email': 'contactmail@gmail.com',
      'number': '123-234-3214'
    },
    {
      'title': 'Another Title',
      'name': 'Another Name',
      'email': 'anothermail@gmail.com',
      'number': '321-456-7890'
    },
    {
      'title': 'Another 2 Title',
      'name': 'Another Name',
      'email': 'anothermail@gmail.com',
      'number': '321-456-7890'
    },{
      'title': 'Another 3 Title',
      'name': 'Another Name',
      'email': 'anothermail@gmail.com',
      'number': '321-456-7890'
    },  ].obs;
}
