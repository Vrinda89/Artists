import 'package:albums/bloc/base_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.bloc, required this.child})
      : super(key: key);

  @override
  State createState() => _BlocProviderState();

  static T of<T extends BaseBloc>(BuildContext context) {
    final BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType() as BlocProvider<T>;
    return provider.bloc;
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
