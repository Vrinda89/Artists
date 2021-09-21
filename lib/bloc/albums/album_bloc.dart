import 'package:albums/bloc/base_bloc.dart';
import 'package:albums/model/albums.dart';
import 'package:albums/repository/albums_repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumBloc extends BaseBloc {
  final _albumsStreamController = ReplaySubject<List<Album>>(maxSize: 1);

  Stream<List<Album>> get getAlbums => _albumsStreamController.stream;

 final _loaderStreamController = ReplaySubject<bool>(maxSize: 1);

  Stream<bool> get loaderStream => _loaderStreamController.stream;

  late Future<Album> futureAlbum;

  @override
  void dispose() {
    _albumsStreamController.close();
    _loaderStreamController.close();
  }

  void fetchAlbums() async {
    _loaderStreamController.sink.add(true);
    DataRepository albumsRepository = DataRepository();
    List<Album> albums = await albumsRepository.fetchAlbum();
    _albumsStreamController.sink.add(albums);
    _loaderStreamController.sink.add(false);
  }
}
