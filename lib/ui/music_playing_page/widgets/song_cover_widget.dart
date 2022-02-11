import 'package:flutter/material.dart';
import 'package:music_app/domain/entity/music.dart';

class SongCoverWidget extends StatelessWidget {
  final Music music;
  const SongCoverWidget({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var appBarHeight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bodyHeight = height - appBarHeight - statusBarHeight;

    return Container(
      margin: EdgeInsets.symmetric(vertical: bodyHeight * 0.01),
      height: bodyHeight * 0.36,
      width: width * 0.74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: NetworkImage(music.cover), fit: BoxFit.cover),
      ),
    );
  }
}
