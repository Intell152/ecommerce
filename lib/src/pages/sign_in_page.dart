import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ecommerce/src/blocs/blocs_provider.dart';
import 'package:ecommerce/src/blocs/sign_in_bloc.dart';
import 'package:ecommerce/src/validations/logbutton_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _customScrollView());
  }

  Widget _customScrollView() {
    List<String> noticias = new List<String>(4);

    noticias = [
      'assets/notice/news.jpg',
      'assets/notice/news2.jpg',
      'assets/notice/news3.jpeg',
      'assets/img/sliverBar.png',
    ];
    return CustomScrollView(slivers: <Widget>[
      _crearAppBar(context, noticias),
      SliverList(
        delegate: SliverChildListDelegate([
          _loginForm(context),
          SizedBox(height: 20.0),
          FlatButton(
            child: Text('Forget your password?',
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center),
            onPressed: () => Navigator.pushNamed(context, 'registro'),
          ),
          SizedBox(height: 20.0)
        ]),
      )
    ]);
  }

  Widget _crearAppBar(BuildContext context, List<String> noticias) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      elevation: 10.0,
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: size.height * 0.41,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
            height: size.height * 0.08,
            // alignment: Alignment.,
            child: Column(children: [
              Text("Logo de la Empresa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  )),
              SizedBox(height: 10.0),
              Text("Nombre de Empresa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  )),
            ])),
        background: _swiperNews(noticias),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = BlocProvider.of(context);
    // final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text('Sign in', style: TextStyle(fontSize: 20.0)),
        SizedBox(height: 30.0),
        _crearEmail(bloc),
        SizedBox(height: 20.0),
        _crearPass(bloc),
        SizedBox(height: 30.0),
        _crearBoton(bloc),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 3.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              'OR',
              style: TextStyle(color: Colors.grey[500]),
            ),
            SizedBox(width: 10.0),
            Container(
              height: 3.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: 150, child: _crearBotonGoogle(bloc)),
            SizedBox(width: 30.0),
            Container(width: 150, child: _crearBotonFace(bloc)),
          ],
        )
      ],
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email,
                    color: Theme.of(context).primaryColor),
                hintText: 'ejemplo@dominio.com',
                labelText: 'Email',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            // onChanged: (value) => bloc.changeEmail(value),  Esto es correcto
            onChanged: bloc.addEmail,
          ),
        );
      },
    );
  }

  Widget _crearPass(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline,
                    color: Theme.of(context).primaryColor),
                labelText: 'Password',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.addPass,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 11.0),
              child: Text('Sign in'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            elevation: 7.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => login(bloc, context) : null);
      },
    );
  }

  Widget _crearBotonGoogle(LoginBloc bloc) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // Creacion de Boton usando flutter_signin_button
      return SignInButton(Buttons.Google,
          text: 'Google',
          elevation: 7.0,
          onPressed: () => loginGoogle(bloc, context));
    });
  }

  Widget _crearBotonFace(LoginBloc bloc) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return SignInButton(Buttons.FacebookNew,
          text: 'Facebook',
          elevation: 7.0,
          onPressed: () => loginFacebook(bloc, context));
    });
  }

  Widget _swiperNews(List<String> noticias) {
    return Swiper(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) => Image.asset(
        noticias[index],
        fit: BoxFit.cover,
      ),
      autoplay: true,
    );
  }
}
