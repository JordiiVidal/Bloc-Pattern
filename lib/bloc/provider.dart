import 'package:flutter/material.dart';

import 'package:bloc_pattern/bloc/login_bloc.dart';
export 'package:bloc_pattern/bloc/login_bloc.dart';


class Provider extends InheritedWidget {


  static Provider _instance;

  factory Provider({Key key, Widget child}){//factory se utiliza para saber si se necesita crear una nueva instancia de la clase reutilizar la existente
    if( _instance == null){
      _instance = new Provider._internal(key:key, child: child,);//constructor privado para que solo se pueda inicializar desde dentro e la propia clase
    }

    return _instance;
  }

  Provider._internal({ Key key, Widget child })
    :super( key:key,child:child );

  final loginBloc = LoginBloc();//variables globales para controlar el flujo de la información

  @override //notificar a los child
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {//context = arbol de widgets
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;//devuleve la instancia del login bloc
  }
}
