import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/components/popup_menu.dart';
import 'package:jhumo/moduls/controller/playlist_controller.dart';
import 'package:jhumo/moduls/model/service.dart';
import 'package:jhumo/moduls/model/themer.dart';

class RecentMusicTile extends StatelessWidget {
  final Result rs;
  final bool isPlayed;
  final String? playlistName;
  RecentMusicTile({super.key, required this.rs, this.isPlayed = false, this.playlistName});
  format(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0").substring(4);
  }

  var _playlistController = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        // contentPadding: EdgeInsets.zero,
        leading: Hero(
          tag: rs,
          child: Container(
              child: isPlayed
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Icon(Icons.play_arrow,color: Themer.light,),
                    )
                  : null,
              height: 50,
              width: 50,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(rs.image![0].url!), fit: BoxFit.cover),
              )),
        ),
        title: Text(
          rs.name!,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            // Text(

            //     "${Duration(seconds: rs.duration!).inMinutes}:${Duration(seconds: rs.duration!).inSeconds.remainder(60)}"),
            Text(format(Duration(seconds: rs.duration!))),
            SizedBox(width: 5),
            Expanded(
                child: Text(
              "${rs.artists!.all![0].name}",
            )),
          ],
        ),
        trailing: JhumoPopupMenu(rs: rs,playlistName: playlistName,)
        // trailing: GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
      ),
    );
  }
}
