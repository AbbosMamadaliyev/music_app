class Music {
  final String songName;
  final String cover;
  final String link;
  final bool isFavourite;

  Music({
    required this.songName,
    required this.cover,
    required this.link,
    this.isFavourite = false,
  });

  factory Music.fromRtDb(Map<String, dynamic> data) {
    return Music(
      songName: data['sound_name'],
      cover: data['cover'],
      link: data['link'],
    );
  }
}
