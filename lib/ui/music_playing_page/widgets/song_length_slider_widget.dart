import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../music_playing_model.dart';

class SongLengthSliderWidget extends StatefulWidget {
  SongLengthSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SongLengthSliderWidget> createState() => _SongLengthSliderWidgetState();
}

class _SongLengthSliderWidgetState extends State<SongLengthSliderWidget> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MusicPlayingModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Slider(
              value: model.position.inSeconds.toDouble(),
              min: 0,
              max: model.duration.inSeconds.toDouble(),
              onChanged: (newValue) {
                model.changeToSecond(newValue.toInt());
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.position.toString().split('.')[0],
                style: const TextStyle(color: Colors.white70),
              ),
              Text(
                model.duration.toString().split('.')[0],
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
