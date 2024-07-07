import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/themer.dart';

class TxtButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const TxtButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Themer.main.withOpacity(0.5), blurRadius: 20, offset: Offset(0, 10))
            ],
            gradient:
                Get.isDarkMode ? Themer.gradientDark : Themer.gradientLight,
            borderRadius: BorderRadius.circular(1000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Get.textTheme.titleMedium!.copyWith(color: Themer.light),
            ),
          ],
        ),
      ),
    );
  }
}
