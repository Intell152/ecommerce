import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/src/blocs/sign_in_bloc.dart';
import 'package:ecommerce/src/providers/usuario_provider.dart';
import 'package:ecommerce/utils/utils.dart';

final userProvider = new UserProvider();

login(LoginBloc bloc, BuildContext context) async {
  // Navigator.pushReplacementNamed(context, 'err');
  Map info = await userProvider.callApiUser(null, bloc.email, bloc.pass);
  if (info['ok']) {
    // print(info['user']);
    bloc.addUser(info['user']);
    bloc.user;
    Navigator.pushReplacementNamed(context, 'home');
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
}

register(LoginBloc bloc, BuildContext context) async {
  // Navigator.pushNamed(context, 'home');

  Map info = await userProvider.callApiUser(bloc.user, bloc.email, bloc.pass);
  if (info['ok']) {
    Navigator.pushReplacementNamed(context, 'home');
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
}

bool isSignIn = false;

Future<void> loginGoogle(LoginBloc bloc, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    GoogleSignIn _googleSignIn = new GoogleSignIn();

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final UserCredential result =
          (await _auth.signInWithCredential(credential));

      final User _user = result.user;
      bloc.addUser(_user.displayName);
      bloc.addEmail(_user.email);
      bloc.addPass('GooglePass');
      Navigator.pushReplacementNamed(context, 'home');
    }
  } catch (e) {
    Navigator.pushNamed(context, 'err');
  }
}

Future<void> loginFacebook(LoginBloc bloc, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //print('Este boton no funciona por ahora');
  try {
    // final LoginResult loginresult = await FacebookAuth.instance.login();
    final dynamic loginresult = await FacebookAuth.instance.login();
    
    if (loginresult.status == 200) {
      final userData = await FacebookAuth.instance.getUserData();

      final AuthCredential credential =
          FacebookAuthProvider.credential(loginresult.accessToken.token);

      final UserCredential result =
          (await _auth.signInWithCredential(credential));

      final User _user = result.user;
      if (_user == null) {
        mostrarAlerta(context, 'Credenciales erroneas.');
      } else {
        bloc.addUser(_user.displayName);
        bloc.addEmail(_user.email);
        bloc.addPass('FacebookPass');
        Navigator.pushReplacementNamed(context, 'home');
      }
    } else if (loginresult.status == 403) {
      mostrarAlerta(context, 'Registro Cancelado por el usuario.');
    } else {
      Navigator.pushNamed(context, 'err');
    }
  } catch (e) {
    Navigator.pushNamed(context, 'err');
  }
}
