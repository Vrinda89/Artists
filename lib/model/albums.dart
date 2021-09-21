class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Album({
    required this.url,
    required this.thumbnailUrl,
    required this.albumId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
