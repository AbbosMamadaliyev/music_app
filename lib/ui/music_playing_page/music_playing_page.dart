import 'package:flutter/material.dart';
import 'package:music_app/domain/entity/music.dart';
import 'package:music_app/ui/music_playing_page/widgets/controller_btn_row_widget.dart';
import 'package:music_app/ui/music_playing_page/widgets/song_author_name_widget.dart';
import 'package:music_app/ui/music_playing_page/widgets/song_cover_widget.dart';
import 'package:music_app/ui/music_playing_page/widgets/song_length_slider_widget.dart';
import 'package:music_app/ui/music_playing_page/widgets/song_play_and_next_btn_widget.dart';

class MusicPlayingPage extends StatelessWidget {
  final int index;
  final Music music;
  const MusicPlayingPage({Key? key, required this.music, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SongCoverWidget(music: music),
              SongAuthorNameWidget(music: music),
              const ControllerBtnRowWidget(),
              SongLengthSliderWidget(),
              SongPlayNextBtnWidget(
                index: index,
                music: music,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
