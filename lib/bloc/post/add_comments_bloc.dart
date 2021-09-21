import 'dart:async';

import 'package:albums/bloc/base_bloc.dart';

class AddCommentsBloc extends BaseBloc {
  final _nameStreamController = StreamController<String>();

  Stream<String> get nameStream => _nameStreamController.stream;

  final _emailStreamController = StreamController<String>();

  Stream<String> get emailStream => _emailStreamController.stream;

  final _commentStreamController = StreamController<String>();

  Stream<String> get commentStream => _commentStreamController.stream;

  @override
  void dispose() {}

  void submitComments(String name, String comments, String email) {
    bool isValid = true;
    if (name.isEmpty) {
      _nameStreamController.sink.addError('Enter a valid name');
      isValid = false;
    }
    if (comments.isEmpty) {
      _commentStreamController.sink.addError('Enter comments');
      isValid = false;
    }
    if (email.isEmpty) {
      _emailStreamController.sink.addError('Enter email');
      isValid = false;
    }
    if (isValid) {

    }
  }
}
