import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/controller/theme_controller.dart';
import 'package:jhumo/moduls/model/themer.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  double radius;
  GlassContainer({super.key, required this.child, this.radius = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(
              color: Get.isDarkMode
                  ? Themer.dark1
                  : Themer.light1),
          borderRadius: BorderRadius.circular(radius),
          color: Get.isDarkMode
                  ? Themer.dark
                  : Themer.light),
      child: child,
    );
  }
}
