import 'dart:async';

class LoginValidators {
  //Validar email al pasar por stream -> Stream transformation
  final validaEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Correo Electronico invalido.');
    }
  });

  final validaPass = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.length >= 6) {
        sink.add(pass);
      } else {
        sink.addError('El password debe tener mas de 6 caracteres.');
      }
    },
  );
}
