import 'package:flutter/material.dart';
import 'package:music_app/ui/auto_biography_page/autobiography_page.dart';
import 'package:music_app/ui/home_page/widgets/custom_alert_dialog.dart';
import 'package:music_app/ui/home_page/widgets/music_list_widget.dart';
import 'package:music_app/ui/home_page/widgets/search_sound_widget.dart';
import 'package:provider/src/provider.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    return Scaffold(
      appBar: AppBar(
        title: const SearchSoundWidget(),
      ),
      body: StreamBuilder(
        stream: model.streamFunc(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return const MusicListWidget();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple.shade800,
        child: ListView(
          padding: const EdgeInsets.only(top: 120, left: 16),
          children: [
            ListTile(
              title: const Text(
                'Biografiya',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.tealAccent,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AutobiographyPage()));
              },
            ),
            ListTile(
              title: const Text(
                'Dastur haqida',
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.info,
                color: Colors.lightGreenAccent,
              ),
              onTap: () {
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const CustomAlertDialog();
        });
  }
}
