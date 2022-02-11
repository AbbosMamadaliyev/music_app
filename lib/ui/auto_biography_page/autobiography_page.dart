import 'package:flutter/material.dart';
import 'package:music_app/ui/auto_biography_page/autobiography_model.dart';
import 'package:provider/src/provider.dart';

class AutobiographyPage extends StatelessWidget {
  const AutobiographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AutobiographyModel>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            children: [
              Text(
                model.text,
                style: const TextStyle(
                    fontSize: 16, color: Colors.white, height: 1.3),
              ),
              const Text(
                '\nKonsta ijtimoiy tarqmoqlari:',
                style:
                    TextStyle(fontSize: 16, color: Colors.white, height: 1.3),
              ),
              TextButton(
                  onPressed: model.youtubeLink, child: const Text('YouTube')),
              TextButton(
                  onPressed: model.instagramLink,
                  child: const Text('Instagram')),
              TextButton(
                  onPressed: model.telegramLink, child: const Text('Telegram')),
            ],
          ),
        ),
      ),
    );
  }
}
