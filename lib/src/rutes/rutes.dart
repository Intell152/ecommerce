import 'package:flutter/material.dart';

import 'package:ecommerce/src/pages/shopping_cart_page.dart';
import 'package:ecommerce/src/pages/products_page.dart';
import 'package:ecommerce/src/pages/home_page.dart';
import 'package:ecommerce/src/pages/rute_error_page.dart';
import 'package:ecommerce/src/pages/sign_in_page.dart';
import 'package:ecommerce/src/pages/sign_up_page.dart';
import 'package:ecommerce/src/pages/item_details_page.dart';


Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    // '/' : (BuildContext context) => FatalErrorPage(),
    '/'    : (BuildContext context) => LoginPage(),
    'registro'    : (BuildContext context) => SignOnPage(),
    'home' : (BuildContext context) => HomePage(),
    'err'  : (BuildContext context) => FatalErrorPage(),
    'productos'  : (BuildContext context) => ProductsPage(),
    'cart'  : (BuildContext context) => ShoppingCart(),
    'details'  : (BuildContext context) => ItemDetails(),
  };
}
