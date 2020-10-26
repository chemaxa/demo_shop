import 'package:demo_shop/entities/product.dart';
import 'package:flutter/material.dart';

class ProductsListPage extends StatelessWidget {
  final List<Product> products;
  final Function onTap;

  ProductsListPage({this.products, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var product in products)
            ListTile(
              title: Text(product.name),
              subtitle: Column(
                children: [
                  Text(product.description),
                  Text(
                    product.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: () => onTap(product),
            )
        ],
      ),
    );
  }
}
