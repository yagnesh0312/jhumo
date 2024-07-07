import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jhumo/components/button.dart';
import 'package:jhumo/components/label.dart';
import 'package:jhumo/components/playlist_tlle.dart';
import 'package:jhumo/moduls/controller/audio_controller.dart';
import 'package:jhumo/moduls/controller/playlist_controller.dart';
import 'package:jhumo/moduls/model/themer.dart';
import 'package:jhumo/screens/fav_page.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PlaylistController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Playlists",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      var _txt = TextEditingController();
                      Get.defaultDialog(
                          title: "Playlist name",
                          content: Column(
                            children: [
                              TextField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLength: 10,
                                controller: _txt,
                              ),
                              SizedBox(height: 10),
                              TxtButton(
                                  onPressed: () {
                                    if (_txt.text.isNotEmpty &&
                                        !controller.playlistName
                                            .contains(_txt.text)) {
                                      controller.createPlayList(_txt.text);
                                      Get.back();
                                    }
                                  },
                                  text: "Create")
                            ],
                          ));
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(FavPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Stack(
                          children: [
                            controller.favSongsResults.isNotEmpty
                                ? Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 20,
                                            offset: Offset(0, 16))
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                (controller.favSongsResults
                                                            .length <=
                                                        5
                                                    ? controller
                                                        .favSongsResults.length
                                                    : 5);
                                            i++) ...[
                                          Expanded(
                                              child: Image.network(
                                            controller.favSongsResults[i]
                                                .image![1].url!,
                                            fit: BoxFit.cover,
                                            height: Get.height * 0.2,
                                          )),
                                        ]
                                      ],
                                    ),
                                  )
                                : Container(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    padding: EdgeInsets.all(16),
                                    alignment: Alignment.bottomLeft,
                                    height: Get.height * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image:
                                          controller.favSongsResults.length == 0
                                              ? DecorationImage(
                                                  image: AssetImage(
                                                      "assets/white_logo.png"),
                                                )
                                              : null,
                                      gradient:
                                          controller.favSongsResults.length == 0
                                              ? Get.isDarkMode
                                                  ? Themer.gradientDark
                                                  : LinearGradient(
                                                      colors: Themer
                                                          .gradientLight.colors,
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft)
                                              : LinearGradient(
                                                  colors: [
                                                    Get.theme
                                                        .scaffoldBackgroundColor
                                                        .withOpacity(0.0),
                                                    Get.theme
                                                        .scaffoldBackgroundColor
                                                  ].reversed.toList(),
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight),
                                      boxShadow:
                                          controller.favSongsResults.length == 0
                                              ? [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      blurRadius: 20,
                                                      offset: Offset(0, 16))
                                                ]
                                              : [],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Favorite's",
                                          style: Get.textTheme.headlineMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${controller.favSongsResults.length} songs",
                                          style:
                                              Get.textTheme.bodySmall!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.playlistName.length,
                        itemBuilder: (context, i) {
                          return PlaylistTlle(name: controller.playlistName[i]);
                          // return Text(
                          //     "${controller.playlistName[i]} ${controller.getPlaylistById(controller.playlistName[i])}");
                        }),
                    GetBuilder<AudioController>(
                        init: AudioController(),
                        builder: (_) {
                          return _.rs != null
                              ? const SizedBox(height: 100)
                              : Container();
                        })
                  ],
                ),
              ));
        });
  }
}
