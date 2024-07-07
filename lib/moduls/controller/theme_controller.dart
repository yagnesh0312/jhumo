import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/themer.dart';

class ThemeController extends GetxController {
  bool isDark = true;
  ThemeData theme = darkTheme;

  changeTheme() {
    isDark = !isDark;
    theme = isDark ? darkTheme : lightTheme;
    update();
  }
}
