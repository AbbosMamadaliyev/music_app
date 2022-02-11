import 'package:flutter/material.dart';
import 'package:music_app/domain/entity/music.dart';

class SongAuthorNameWidget extends StatelessWidget {
  final Music music;

  const SongAuthorNameWidget({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var appBarHeight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var bodyHeight = height - appBarHeight - statusBarHeight;

    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          music.songName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Konsta',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: bodyHeight * 0.05),
      ],
    );
  }
}
