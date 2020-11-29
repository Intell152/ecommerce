import 'package:flutter/material.dart';

import 'package:ecommerce/src/blocs/blocs_provider.dart';
import 'package:ecommerce/src/blocs/sign_in_bloc.dart';
import 'package:ecommerce/src/validations/logbutton_validator.dart';

class SignOnPage extends StatefulWidget {
  @override
  _SignOnPageState createState() => _SignOnPageState();
}

class _SignOnPageState extends State<SignOnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _customScrollView());
  }

  Widget _customScrollView() {
    return CustomScrollView(slivers: <Widget>[
      _crearAppBar(context),
      SliverList(
        delegate: SliverChildListDelegate([
          _loginForm(context),
        ]),
      )
    ]);
  }

  Widget _crearAppBar(BuildContext context) {
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
        // background: _swiperNews(noticias),
        background: Image.asset('assets/img/sliverBar.png', fit: BoxFit.cover ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = BlocProvider.of(context);
    // final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(height: 30.0),
        Text('Sign up', style: TextStyle(fontSize: 20.0)),
        SizedBox(height: 30.0),
        _crearUser(bloc),
        SizedBox(height: 20.0),
        _crearEmail(bloc),
        SizedBox(height: 20.0),
        _crearPass(bloc),
        SizedBox(height: 30.0),
        _crearBoton(bloc),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _crearUser(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.userNameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                icon: Icon(Icons.person_outline,
                    color: Theme.of(context).primaryColor),
                hintText: 'Nombre de usuario',
                labelText: 'User',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            // onChanged: (value) => bloc.changeEmail(value),  Esto es correcto
            onChanged: bloc.addUser,
          ),
        );
      },
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
              child: Text('Sign up'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            elevation: 7.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => register(bloc, context) : null);
      },
    );
  }
}