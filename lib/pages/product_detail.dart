import 'package:flutter/material.dart';
import 'package:demo_shop/entities/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product != null) ...[
              Text(product.name, style: Theme.of(context).textTheme.headline6),
              Text(product.description,
                  style: Theme.of(context).textTheme.subtitle1),
              Text(product.price.toString(),
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
