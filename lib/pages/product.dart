import 'package:demo_shop/entities/product.dart';
import 'package:demo_shop/pages/product_detail.dart';
import 'package:flutter/material.dart';

class ProductPage extends Page {
  final Product product;

  ProductPage({this.product}) : super(key: ValueKey(product));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ProductDetailsScreen(product: product);
      },
    );
  }
}
