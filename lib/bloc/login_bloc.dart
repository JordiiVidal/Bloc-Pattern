import 'dart:async';

import 'package:bloc_pattern/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{

  final _emailController = BehaviorSubject<String>();//cada vez que se realizen cambios va a pasar por el controller 
  final _passwordController = BehaviorSubject<String>();//normal usar stream controller .brodcast per rx no usa streamcontroller y para combinar dos streams usamos behav... que tambien es unstream de tipo brodcast

  /// recupera los datos del stream
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);//mixin

  Stream<bool> get formValidation => CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);//si hay data en los dos enviamos un true

  /// insertar valores 
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener value

  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }



}