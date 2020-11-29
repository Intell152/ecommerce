import 'package:flutter/material.dart';

import 'package:ecommerce/src/blocs/sign_in_bloc.dart';
import 'package:ecommerce/src/blocs/blocs_provider.dart';
import 'package:ecommerce/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).primaryColor,
        title: Text('Home'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              }),
        ],
      ),
      drawer: MenuWidget(),
      body: Center(
        child: _testFunc(bloc),
      ),
      // body: Stack(children: <Widget>[
      //    Corazon(),
      //    Center(child: Text('Te amo Diana', style: TextStyle(fontSize: 34),)),
      // ]),
    );
  }

  Widget _testFunc(bloc) {
    String _user = '';

    // bloc.pass == 'GooglePass' || bloc.pass == 'FacebookPass'
    //     ? _user = bloc.user.toString(): _user = '';
    _user = bloc.user.toString();

    return Text('Holi' + ' ' + _user);
  }
}
