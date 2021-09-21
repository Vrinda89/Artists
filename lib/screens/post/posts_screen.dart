import 'package:albums/bloc/post/posts_bloc.dart';
import 'package:albums/font_type.dart';
import 'package:albums/model/albums.dart';
import 'package:albums/screens/albums/albums_item_view.dart';
import 'package:albums/screens/home/card_view.dart';
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
    bloc?.fetchAlbums();
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
        if (data != null && data is List<Album>) {
          List<Album> list = data;
          return list.isNotEmpty ? _getAlbumsList(list) : _getNoDataWidget();
        } else {
          return _getNoDataWidget();
        }
      },
    );
  }

  Widget _getAlbumsList(List<Album> albums) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: albums.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              alignment: Alignment.center,
              child: CustomCardView(
                body: AlbumsItemView(
                  title: albums[index].title,
                  thumbNailUrl: albums[index].thumbnailUrl,
                ),
              ));
        });
  }

  Widget _getNoDataWidget() {
    return const Padding(
        padding: EdgeInsets.all(60),
        child: TypeFacedText(
          title: 'No albums available',
          color: Colors.black,
          textAlign: TextAlign.center,
          textSize: 15.0,
          fontType: FontType.italic,
        ));
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
