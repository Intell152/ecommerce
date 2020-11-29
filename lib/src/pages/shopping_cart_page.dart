import 'package:flutter/material.dart';

import 'package:ecommerce/src/widgets/menu_widget.dart';

class ShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping cart'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {}
          // ),
          // IconButton(
          //   icon: Icon(Icons.shopping_cart_outlined),
          //   onPressed: () {}
          // ),
        ],
      ),
      drawer: MenuWidget(),
    );
  }
}