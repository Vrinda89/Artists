import 'package:albums/bloc/albums/album_bloc.dart';
import 'package:albums/font_type.dart';
import 'package:albums/model/albums.dart';
import 'package:albums/screens/home/card_view.dart';
import 'package:albums/utils/ui/base_state.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/bloc_provider.dart';
import 'albums_item_view.dart';

class AlbumsScreen extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends BaseState<AlbumsScreen> {
  AlbumBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = AlbumBloc();
    bloc?.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumBloc>(
      bloc: AlbumBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const TypeFacedText(
            title: "Albums",
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
    return Stack(
      children: [
        StreamBuilder(
          stream: bloc?.getAlbums,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var data = snapshot.data;
            if (data != null && data is List<Album>) {
              List<Album> list = data;
              return list.isNotEmpty
                  ? _getAlbumsList(list)
                  : _getNoDataWidget();
            } else {
              return const SizedBox();
            }
          },
        ),
        Center(
          child: _getLoader(),
        )
      ],
    );
  }

  Widget _getLoader() {
    return StreamBuilder(
      stream: bloc?.loaderStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        var data = snapshot.data;
        return Visibility(
            visible: data != null ? data as bool : false,
            child: const CircularProgressIndicator());
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
    return const Center(
      child: Padding(
          padding: EdgeInsets.all(60),
          child: TypeFacedText(
            title: 'No albums available',
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
