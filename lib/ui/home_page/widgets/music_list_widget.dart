import 'package:flutter/material.dart';
import 'package:music_app/ui/music_playing_page/music_playing_model.dart';
import 'package:music_app/ui/music_playing_page/music_playing_page.dart';
import 'package:provider/src/provider.dart';

import '../home_page_model.dart';

class MusicListWidget extends StatelessWidget {
  const MusicListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var appBarHeight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var bodyHeight = height - appBarHeight - statusBarHeight;

    final musicList = context.watch<HomePageModel>().musicList;

    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 24),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      children: List.generate(
        musicList.length,
        (index) {
          var music = musicList[index];
          final link = music.link;

          return Center(
            child: GestureDetector(
              onTap: () {
                context
                    .read<MusicPlayingModel>()
                    .setUrl(link, index, musicList.length);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MusicPlayingPage(
                      music: music,
                      index: index,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: bodyHeight * 0.18,
                    width: width * 0.36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(music.cover), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    music.songName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
