import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jhumo/components/side_bar_tile.dart';
import 'package:jhumo/moduls/controller/page_controller.dart';
import 'package:jhumo/moduls/model/themer.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});
  @override
  Widget build(BuildContext context) {
    String name = GetStorage("user").read("name");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder(
                  init: ScreenController(),
                  builder: (controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   "Jhumo",
                        //   style: TextStyle(fontSize: 50),
                        // ),

                        SizedBox(height: 20),
                        Divider(),
                        GestureDetector(
                          onTap: () {
                            controller.changePage(0);
                          },
                          child: SideBarTile(
                            icon: Icons.home,
                            ispage: controller.currentScreen == 0,
                            text: "Home",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changePage(1);
                          },
                          child: SideBarTile(
                            icon: Icons.plus_one,
                            ispage: controller.currentScreen == 1,
                            text: "Collaboration",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changePage(3);
                          },
                          child: SideBarTile(
                            icon: Icons.favorite,
                            ispage: controller.currentScreen == 3,
                            text: "Favorite",
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Text(
            "by\n Yagnesh Jariwala",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Themer.light1),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
