import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app/domain/entity/music.dart';

class HomePageModel extends ChangeNotifier {
  final dataBase = FirebaseDatabase.instance.ref();
  late List<Music> _musicList;
  String? _searchQuery;
  Timer? searchDebounce;
  late StreamSubscription<DatabaseEvent> _musicListStream;

  List<Music> get musicList => _musicList;

  HomePageModel() {
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
    });
  }

  @override
  void dispose() {
    _musicListStream.cancel();
    super.dispose();
  }

  streamFunc() => dataBase.child('musicList').onValue;

  void searchSound(String text) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 450), () async {
      final searchQuery = text.isNotEmpty ? text : null;

      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;

      if (_searchQuery == null) {
        getDataFromRTDb();
        notifyListeners();
        return;
      }

      if (_musicList.isNotEmpty) {
        for (var music in _musicList) {
          if (music.songName
                  .toLowerCase()
                  .contains(_searchQuery!.toLowerCase().trim()) ==
              true) {
            _musicList.clear();
            _musicList.add(music);
            notifyListeners();
          }
        }
      }
    });
  }
}
