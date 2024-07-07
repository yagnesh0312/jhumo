import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhumo/moduls/model/service.dart';

class AlbumTile extends StatelessWidget {
final Result rs;
  const AlbumTile({super.key, required this.rs});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(rs.image![1].url!)),
          Text(rs.name!,overflow: TextOverflow.ellipsis,),
          Text(rs.artists!.all![0].name!,style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.5)),),
        ],
      ),
    );
  }
}
