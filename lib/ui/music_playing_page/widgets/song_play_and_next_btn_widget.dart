import 'package:flutter/material.dart';
import 'package:music_app/domain/entity/music.dart';
import 'package:music_app/ui/music_playing_page/music_playing_model.dart';
import 'package:provider/src/provider.dart';

class SongPlayNextBtnWidget extends StatelessWidget {
  final int index;
  final Music music;

  const SongPlayNextBtnWidget(
      {Key? key, required this.music, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var appBarHeight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bodyHeight = height - appBarHeight - statusBarHeight;

    final model = context.watch<MusicPlayingModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: bodyHeight * 0.1,
          width: width * 0.25,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: bodyHeight * 0.07,
            ),
          ),
        ),
        Container(
          height: bodyHeight * 0.15,
          width: width * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan.withOpacity(0.2),
          ),
          child: model.isLoading
              ? const CircularProgressIndicator()
              : IconButton(
                  onPressed: () {
                    model.playSound(index, model.linkSound);
                  },
                  icon: Icon(
                    model.isPlaying[index]
                        ? Icons.pause
                        : Icons.play_arrow, // Icons.pause
                    color: Colors.white,
                    size: bodyHeight * 0.07,
                  ),
                ),
        ),
        SizedBox(
          height: bodyHeight * 0.1,
          width: width * 0.25,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: bodyHeight * 0.07,
            ),
          ),
        ),
      ],
    );
  }
}
