import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AutobiographyModel extends ChangeNotifier {
  final dataBase = FirebaseDatabase.instance.ref();
  String _text = '';

  String get text => _text;

  AutobiographyModel() {
    getBiography();
  }

  void getBiography() {
    dataBase.child('biography').onValue.listen((event) {
      _text = event.snapshot.value.toString();
      notifyListeners();
    });
  }

  youtubeLink() async {
    const url = 'https://www.youtube.com/channel/UCcvINW0IhxBIrzjC7OEumcQ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  instagramLink() async {
    const url = 'https://www.instagram.com/konsta_uz/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  telegramLink() async {
    const url = 'https://t.me/konsta';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
