import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/themer.dart';

class SideBarTile extends StatelessWidget {
  final IconData icon;
  final bool ispage;
  final String text;
  const SideBarTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.ispage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon,
              color: Get.isDarkMode
                  ? ispage
                      ? Themer.main
                      : Themer.light
                  : ispage
                      ? Themer.main
                      : Themer.dark1),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
                fontWeight: ispage ? FontWeight.bold : FontWeight.normal,
                fontSize: ispage?20:16,
                color: Get.isDarkMode
                    ? ispage
                        ? Themer.main
                        : Themer.light
                    : ispage
                        ? Themer.main
                        : Themer.dark1),
          ),
        ],
      ),
    );
  }
}
