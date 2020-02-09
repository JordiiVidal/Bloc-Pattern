import 'package:bloc_pattern/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     final bloc = Provider.of(
        context);
    return Scaffold(
      appBar: AppBar(title: Text(bloc.email),),
    );
  }
}