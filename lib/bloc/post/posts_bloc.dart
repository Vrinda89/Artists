import 'package:albums/bloc/base_bloc.dart';
import 'package:albums/model/comments.dart';
import 'package:albums/model/posts.dart';
import 'package:albums/repository/data_repository.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc extends BaseBloc {
  final _postsStreamController = ReplaySubject<List<Posts>>(maxSize: 1);

  Stream<List<Posts>> get getPosts => _postsStreamController.stream;

   final _commentsStreamController = ReplaySubject<List<Comments>>(maxSize: 1);

  Stream<List<Comments>> get getComments => _commentsStreamController.stream;

  @override
  void dispose() {
    _postsStreamController.close();
  }

  void fetchPosts() async {
    DataRepository repository = DataRepository();
    List<Posts> posts = await repository.fetchPosts();
    _postsStreamController.sink.add(posts);
  }

  Future<void> fetchComments(int postId) async {
    DataRepository repository = DataRepository();
    List<Comments> comments = await repository.fetchComments(postId);
    _commentsStreamController.sink.add(comments);
  }
}
