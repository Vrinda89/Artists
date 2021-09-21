import 'package:albums/bloc/post/posts_bloc.dart';
import 'package:albums/font_type.dart';
import 'package:albums/model/comments.dart';
import 'package:albums/model/posts.dart';
import 'package:albums/resources/palette.dart';
import 'package:albums/utils/ui/base_state.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/bloc_provider.dart';

class PostScreen extends StatefulWidget {
  static const routeName = '/posts';

  const PostScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostsScreenState();
}

class _PostsScreenState extends BaseState<PostScreen> {
  PostsBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = PostsBloc();
    bloc?.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      bloc: PostsBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const TypeFacedText(
            title: "Posts",
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _captureImage();
                },
                child: const Icon(
                  Icons.add_circle,
                  size: 26.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: _getBaseWidget(),
      ),
    );
  }

  Widget _getBaseWidget() {
    return StreamBuilder(
      stream: bloc?.getPosts,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var data = snapshot.data;
        if (data != null && data is List<Posts>) {
          List<Posts> list = data;
          return list.isNotEmpty ? _getPostsList(list) : _getNoDataWidget();
        } else {
          return _getNoDataWidget();
        }
      },
    );
  }

  Widget _getPostsList(List<Posts> posts) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          onExpansionChanged: (value) {
            if (value) {
              bloc?.fetchComments(posts[index].id);
            }
          },
          title: TypeFacedText(
            fontType: FontType.bold,
            title: posts[index].title,
            color: Colors.black,
            textSize: 16.0,
          ),
          children: <Widget>[
            _getExpandedView(posts[index].id),
          ],
        );
      },
    );
  }

  Widget _getExpandedView(int id) {
    return StreamBuilder(
      stream: bloc?.getComments,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var data = snapshot.data;
        if (data != null && data is List<Comments>) {
          List<Comments> list = data;
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TypeFacedText(
                  title: list[index].body,
                  color: Palette.primaryColor,
                  fontType: FontType.bold,
                  textSize: 14.0,
                ),
                subtitle: const Divider(
                  color: Colors.black54,
                ),
              );
            },
          );
        } else {
          return _getNoDataWidget();
        }
      },
    );
  }

  Widget _getNoDataWidget() {
    return const Center(
      child: Padding(
          padding: EdgeInsets.all(60),
          child: TypeFacedText(
            title: 'No posts available',
            color: Colors.black,
            textAlign: TextAlign.center,
            textSize: 15.0,
            fontType: FontType.italic,
          )),
    );
  }

  @override
  dispose() {
    bloc?.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // ignore: avoid_print
    print(photo!.path);
  }
}
