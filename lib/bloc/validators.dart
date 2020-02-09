import 'dart:async';

class Validators {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Invalid password');
    }
  }); //<entrada,salida>

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if( RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) ){
          sink.add(email);
      }else{
          sink.addError('Invalid Email');
      }
    }
  );

}
