import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MusicPlayingModel extends ChangeNotifier {
  AudioPlayer advancedPlayer = AudioPlayer();

  var duration = const Duration();
  var position = const Duration();
  String linkSound = '';

  List<bool> isPlaying = [];
  bool isRepeat = false;
  bool isMute = false;
  int indexSound = 0;
  bool isPressShareBtn = false;
  bool isLoading = false;
  List<bool> isFavorite = [];

  void setUrl(String link, int index, int listLength) {
    isLoading = true;
    notifyListeners();

    isPlaying = List.filled(listLength, false, growable: true);
    linkSound = link;

    stopSong(index);
    notifyListeners();
    advancedPlayer.setUrl(link);
    advancedPlayer.onDurationChanged.listen((event) {
      duration = event;
      notifyListeners();
    });
    advancedPlayer.onAudioPositionChanged.listen((event) {
      position = event;
      notifyListeners();
    });

    playSound(index, link);
    isLoading = false;
    notifyListeners();
  }

  shareSound() async {
    isPressShareBtn = true;
    notifyListeners();
    try {
      var url = linkSound;
      print('linkSound: $linkSound');
      var response = await get(Uri.parse(url));
      final Uint8List list = response.bodyBytes;

      indexSound += 1;
      final tempDir = await getTemporaryDirectory();
      final file =
          await File('${tempDir.path}/konsta_$indexSound.mp3').create();
      file.writeAsBytesSync(list);

      Share.shareFiles([file.path]);
      notifyListeners();
    } catch (e) {
      print('Share error: $e');
    }
    isPressShareBtn = false;
    notifyListeners();
  }

  void stopSong(int index) {
    duration = const Duration(seconds: 0);
    position = const Duration(seconds: 0);
    isPlaying[index] = false;
    isMute = false;
    notifyListeners();
    advancedPlayer.stop();
  }

  void playSound(int index, String link) {
    if (!isPlaying[index]) {
      advancedPlayer.play(link);
      isPlaying[index] = true;
      notifyListeners();
    } else {
      advancedPlayer.pause();
      isPlaying[index] = false;
      notifyListeners();
    }

    advancedPlayer.onPlayerCompletion.listen((event) {
      position = const Duration(seconds: 0);
      isPlaying[index] = false;
      notifyListeners();
    });
  }

  void changeToSecond(int value) {
    Duration newDuration = Duration(seconds: value);
    advancedPlayer.seek(newDuration);
    notifyListeners();
  }

  void repeatSong() {
    if (!isRepeat) {
      advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
      isRepeat = true;
      notifyListeners();
    } else {
      advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
      isRepeat = false;
      notifyListeners();
    }
  }

  void muteSong() {
    if (isMute) {
      advancedPlayer.setVolume(1);
      isMute = false;
      notifyListeners();
    } else {
      advancedPlayer.setVolume(0);
      isMute = true;
      notifyListeners();
    }
  }

  void nextMusic(String link, int index, int listLength) {
    setUrl(link, index, listLength);
  }
}
