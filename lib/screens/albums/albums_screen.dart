import 'package:albums/bloc/albums/album_bloc.dart';
import 'package:albums/utils/ui/base_state.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/bloc_provider.dart';

class AlbumsScreen extends StatefulWidget {
  static const routeName = '/albums';

  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends BaseState<AlbumsScreen> {
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
                onTap: () {},
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
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
