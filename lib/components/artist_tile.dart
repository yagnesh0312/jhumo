import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/service.dart';
import 'package:jhumo/moduls/model/themer.dart';

class ArtistTile extends StatelessWidget {
  final Result result;
  const ArtistTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
              child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                shape: BoxShape.circle,
                border: Border.all(color: Themer.main, width: 2),
                image: DecorationImage(
                    image: NetworkImage(
                      result.image![1].url!,
                    ),
                    fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )),
          SizedBox(height: 10),
          Text(
            result.name!,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
