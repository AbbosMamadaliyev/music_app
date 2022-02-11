import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/domain/entity/music.dart';

class MusicDataProvider extends ChangeNotifier {
  final dataBase = FirebaseDatabase.instance.ref();
  List<Music> _musicList = [];
  List<Music> get musicList => _musicList;
  late StreamSubscription<DatabaseEvent> _musicListStream;

  MusicDataProvider() {
    getDataFromRTDb();
  }

  void getDataFromRTDb() {
    _musicListStream = dataBase.child('musicList').onValue.listen((event) {
      final list = event.snapshot.value as List;
      _musicList = list.map((element) {
        final map = Map<String, dynamic>.from(element);
        return Music.fromRtDb(map);
      }).toList();
      notifyListeners();
      print('1: ${_musicList.length}');
    });
    print(_musicList.length);
  }

  streamFunc() {
    dataBase.child('musicList').onValue;
  }

  disposeStream() {
    _musicListStream.cancel();
  }
}
