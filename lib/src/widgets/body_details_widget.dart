import 'package:flutter/material.dart';

import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/src/models/products_model.dart';

import 'package:ecommerce/src/pages/components/add_to_cart.dart';
import 'package:ecommerce/src/pages/components/color_and_size.dart';
import 'package:ecommerce/src/pages/components/counter_with_fav_btn.dart';
import 'package:ecommerce/src/pages/components/description.dart';
import 'package:ecommerce/src/pages/components/product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
    
    // return SingleChildScrollView(
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height:  size.height,
    //         child: Stack(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.only(top: size.height * 0.3),
    //               height: size.height * 0.7,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(24),
    //                   topRight: Radius.circular(24)
    //                 )
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     "Hand Bag",
    //                     style: TextStyle(color: Colors.white),
    //                   ),
    //                   Text(
    //                     product.title,
    //                     style: Theme.of(context).textTheme.headline4.copyWith(
    //                       color: Colors.white, fontWeight: FontWeight.bold
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 RichText(
    //                   text: TextSpan(
    //                     children: [
    //                       TextSpan(text: 'Price\n'),
    //                       TextSpan(
    //                         text: '\$${product.price}',
    //                         style: Theme.of(context)
    //                             .textTheme
    //                             .headline4
    //                             .copyWith(
    //                               color: Colors.white,
    //                               fontWeight: FontWeight.bold,
    //                             )
    //                       ),
    //                     ], 
    //                   ),
    //                 ),
    //                 SizedBox(width: kDefaultPaddin),
    //                 Expanded(
    //                   child: Image.asset(product.image),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
