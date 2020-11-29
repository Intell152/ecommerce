import 'package:rxdart/rxdart.dart';

import 'package:ecommerce/src/validations/sign_in_validator.dart';

class LoginBloc with LoginValidators {
  final _emailController = BehaviorSubject<String>();
  final _passController = BehaviorSubject<String>();
  final _userNameController = BehaviorSubject<String>();

  // Recupera datos del Stream Transformator
  Stream<String> get emailStream =>
      _emailController.stream.transform(validaEmail);
  Stream<String> get passStream => _passController.stream.transform(validaPass);
  Stream<String> get userNameStream => _userNameController.stream;

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passStream, (a, b) => true);

  // Incertar datos en Stream
  Function(String) get addEmail => _emailController.sink.add;
  Function(String) get addPass => _passController.sink.add;
  Function(String) get addUser => _userNameController.sink.add;

  // Obtener ultimo valor ingresado en Streams
  String get email => _emailController.value;
  String get pass => _passController.value;
  String get user => _userNameController.value;

  // Cerrar Streams
  dispose() {
    _emailController?.close();
    _passController?.close();
    _userNameController?.close();
  }
}
