import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../music_playing_model.dart';

class ControllerBtnRowWidget extends StatelessWidget {
  const ControllerBtnRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var appBarHeight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var bodyHeight = height - appBarHeight - statusBarHeight;
    final model = context.watch<MusicPlayingModel>();

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 24.0, vertical: bodyHeight * 0.016),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              model.muteSong();
              print(bodyHeight * 0.5);
            },
            icon: Icon(
              model.isMute ? Icons.volume_mute : Icons.volume_down,
              color: Colors.white70,
            ),
          ),
          IconButton(
            onPressed: () {
              model.repeatSong();
            },
            icon: Icon(
              model.isRepeat ? Icons.repeat_one : Icons.repeat,
              color: Colors.white70,
            ),
          ),
          model.isPressShareBtn
              ? const CircularProgressIndicator()
              : IconButton(
                  onPressed: () {
                    model.shareSound();
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white70,
                  ),
                ),
        ],
      ),
    );
  }
}
