import 'package:flutter/material.dart';

class SidePlayer extends StatelessWidget {
  const SidePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text("Now Playing"),
          ),
          // Container(
          //   decoration: BoxDecoration(image: DecorationImage(image: Ne)),
          // ),
          Text("Title"),
          Text("Subtitle"),
          Slider(
            value: 3,
            onChanged: (v) {},
            max: 100,
            min: 0,
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous_rounded),
              Icon(Icons.play_arrow_rounded),
              Icon(Icons.skip_next_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
