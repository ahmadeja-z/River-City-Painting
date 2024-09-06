import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  final currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
