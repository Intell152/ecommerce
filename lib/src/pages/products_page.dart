import 'package:ecommerce/src/widgets/item_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/src/widgets/menu_widget.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          bottom: _creaTabBar(),
          actions: _creaIconButons(context),
        ),
        drawer: MenuWidget(),
        body: _contenidoTabBar(),
      ),
    );
  }

  List<Widget> _creaIconButons(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {

        }
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          Navigator.pushNamed(context, 'cart');
        }
      ),
    ];
  }

  Widget _creaTabBar() {
    return TabBar(
      indicatorColor: Colors.black,
      isScrollable: false,
      tabs: <Widget>[
        Text('Hands Bag', style: TextStyle(color: Colors.black, fontSize: 18)),//Icon(Icons.looks_one),
        Text('Hands Bag 2', style: TextStyle(color: Colors.black, fontSize: 18))//Icon(Icons.looks_two)
      ],
    );
  }

  Widget _contenidoTabBar() {
    return TabBarView(
      children: <Widget>[
        ItemCardPage(),
        ItemCardPage(),
      ],
    );
  }
}
