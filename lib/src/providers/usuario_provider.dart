import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyBUdoJKu7WDgVHyDKs3fJS_PfzVdH2KaS8';

  Future<Map<String, dynamic>> callApiUser( String user, String email, String password) async {
    Map<String, dynamic> decodedResp;
    final authData = {
      'displayName' : user,
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    if (user != null) {
      final respnew = await http.post(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
          body: json.encode(authData));
      decodedResp = json.decode(respnew.body);
    } else {
      final respsign = await http.post(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
          body: json.encode(authData));
      decodedResp = json.decode(respsign.body);
    }

    if (decodedResp.containsKey('idToken')) {
      //Salvar token en storage
      // _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken'], 'user' : decodedResp['displayName']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
