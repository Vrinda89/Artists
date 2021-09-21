import 'package:albums/bloc/base_bloc.dart';
import 'package:albums/model/posts.dart';
import 'package:albums/repository/albums_repository.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc extends BaseBloc {
  final _postsStreamController = ReplaySubject<List<Posts>>(maxSize: 1);

  Stream<List<Posts>> get getPosts => _postsStreamController.stream;

  late Future<Posts> futurePosts;

  @override
  void dispose() {
    _postsStreamController.close();
  }

  void fetchAlbums() async {
    DataRepository repository = DataRepository();
    List<Posts> posts = await repository.fetchPosts();
    _postsStreamController.sink.add(posts);
  }
}
