import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainPageController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
