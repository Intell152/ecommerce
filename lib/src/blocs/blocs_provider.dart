import 'package:ecommerce/src/blocs/sign_in_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final _loginBloc = new LoginBloc();

  static BlocProvider _instancia;

  factory BlocProvider({Key key, Widget child}){
    if (_instancia == null) {
      _instancia = new BlocProvider._internal(key: key, child: child);
    }

    return _instancia;
  }

  // esto es para mantener los datos
  BlocProvider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType <BlocProvider>()._loginBloc;
  }
}
