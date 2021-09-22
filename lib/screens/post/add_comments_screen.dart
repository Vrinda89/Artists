import 'package:albums/bloc/post/add_comments_bloc.dart';
import 'package:albums/utils/ui/base_state.dart';
import 'package:albums/utils/ui/type_faced_text.dart';
import 'package:albums/utils/ui/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../bloc/bloc_provider.dart';

class AddComments extends StatefulWidget {
  static const routeName = '/comments';

  const AddComments({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostsScreenState();
}

class _PostsScreenState extends BaseState<AddComments> {
  final nameController = TextEditingController();
  final commentsController = TextEditingController();
  final emailController = TextEditingController();
  AddCommentsBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = AddCommentsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddCommentsBloc>(
      bloc: AddCommentsBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _getAppBar(),
        body: _getBaseWidget(),
      ),
    );
  }

  Widget _getBaseWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getNameWidget(),
            UiHelper.verticalSpaceSmall,
            _getEmailWidget(),
            UiHelper.verticalSpaceSmall,
            _getCommentsWidget(),
            UiHelper.verticalSpaceSmall,
            _getSubmitButton()
          ],
        ),
      ),
    );
  }

  Widget _getNameWidget() {
    return StreamBuilder(
        stream: bloc!.nameStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            controller: nameController,
            decoration: InputDecoration(
                errorText: snapshot.hasError ? snapshot.error as String : null,
                border: const OutlineInputBorder(),
                hintText: 'Enter Name'),
            onChanged: (value) {
              bloc!.validateInput(value, Validate.name);
            },
          );
        });
  }

  Widget _getEmailWidget() {
    return StreamBuilder(
        stream: bloc!.emailStream,
        builder: (context, snapshot) {
          return TextField(
            controller: emailController,
            decoration: InputDecoration(
              errorText: snapshot.hasError ? snapshot.error as String : null,
              border: const OutlineInputBorder(),
              hintText: 'Enter Email',
            ),
            onChanged: (value) {
              bloc!.validateInput(value, Validate.email);
            },
          );
        });
  }

  Widget _getCommentsWidget() {
    return StreamBuilder(
        stream: bloc!.commentStream,
        builder: (context, snapshot) {
          return TextField(
            minLines: 3,
            maxLines: 10,
            controller: commentsController,
            decoration: InputDecoration(
                errorText: snapshot.hasError ? snapshot.error as String : null,
                border: const OutlineInputBorder(),
                hintText: 'Enter Comments'),
            onChanged: (value) {
              bloc!.validateInput(value, Validate.comments);
            },
          );
        });
  }

  @override
  dispose() {
    bloc?.dispose();
    nameController.dispose();
    emailController.dispose();
    commentsController.dispose();
    super.dispose();
  }

  Widget _getSubmitButton() {
    return SizedBox(
      height: 45.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onPressed: () {
          bloc!.submitComments(nameController.text, commentsController.text,
              emailController.text);
        },
        child: const TypeFacedText(
          title: 'Submit',
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const TypeFacedText(
        title: "Add Comments",
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
    );
  }
}
