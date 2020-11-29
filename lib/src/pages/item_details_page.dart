import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/src/models/products_model.dart';
import 'package:ecommerce/src/widgets/body_details_widget.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(product, context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(Product product, BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      actions: [
        IconButton(color: Colors.white, icon: Icon(Icons.search), onPressed: () {}),
        IconButton(
            color: Colors.white,
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'cart');
            }),
        SizedBox(width: kDefaultPaddin / 2,)
      ],
    );
  }
}
