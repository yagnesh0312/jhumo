import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/controller/playlist_controller.dart';

import '../moduls/model/service.dart';

class JhumoPopupMenu extends StatelessWidget {
  final Result rs;
  final String? playlistName;
   JhumoPopupMenu({super.key, required this.rs,  this.playlistName});
  var _playlistController = Get.put(PlaylistController());
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.playlist_add),
      itemBuilder: (context) {
        return [
          PopupMenuItem(

            child: Text("add to Favorites"),
            onTap: () {
              _playlistController.addToFev(rs);
              Get.snackbar("Success", "Added to Favorites");
            },
          ),
          for (int i = 0; i < _playlistController.playlistName.length; i++) ...[
            PopupMenuItem(
              child: Text("add to '${_playlistController.playlistName[i]}'"),
              onTap: () {
                // _playlistController.addToFev(rs);
                // Get.snackbar("Success", "Added to Favorites");
                _playlistController.addToPlaylist(
                    _playlistController.playlistName[i], rs);
              },
            ),
          ],
          if(playlistName!=null)...[
            PopupMenuItem(
              child: Text("Remove",style: TextStyle(color: Colors.red),),
              onTap: () {
                // _playlistController.addToFev(rs);
                // Get.snackbar("Success", "Added to Favorites");
                _playlistController.removeFromPlaylist(playlistName!, rs);
              },
            ),
          ]
        ];
      },
    );
  }
}
