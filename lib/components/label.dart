import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/themer.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool line;
  const LabelText({super.key, required this.text,  this.line = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, top: 20, bottom: 10),
        child: Row(
          children: [
            Text(text,
                style: Get.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
        if(line)    Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Themer.main,
                  gradient: LinearGradient(
                      colors: Get.isDarkMode
                          ? Themer.gradientDark.colors
                          : Themer.gradientLight.colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              height: 5,
            ))
          ],
        ));
  }
}
