import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:jhumo/screens/album_page/const.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    Key? key,
    required this.scrollController,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.playPauseButtonSize,
    required this.infoBoxHeight,
  }) : super(key: key);

  final ScrollController scrollController;
  final double maxAppBarHeight;
  final double minAppBarHeight;
  final double playPauseButtonSize;
  final double infoBoxHeight;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.scrollController.addListener(() {
      setState(() {});
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 2;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      //When adjusting position, add/subtract in addOrSubtractValue
      double addOrSubtractValue =
          widget.infoBoxHeight - widget.playPauseButtonSize - 10;
      final bool isFinalPosition =
          offset > (position - finalPosition + addOrSubtractValue);
      if (!isFinalPosition) {
        position = position - offset + addOrSubtractValue;
      } else {
        position = finalPosition;
      }
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getPositionFromTop,
      right: 10,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,color: Colors.green
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
