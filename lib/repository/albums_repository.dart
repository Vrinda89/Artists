import 'dart:convert';

import 'package:albums/model/albums.dart';
import 'package:http/http.dart' as http;

class AlbumsRepository {
  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (responseJson as List).map((p) => Album.fromJson(p)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
