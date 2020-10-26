import 'package:demo_shop/pages/product.dart';
import 'package:demo_shop/pages/products_list.dart';
import 'package:flutter/material.dart';
import 'package:demo_shop/entities/product.dart';

main() => runApp(DemoShopApp());

class DemoShopApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoShopAppState();
}

class _DemoShopAppState extends State<DemoShopApp> {
  List<Product> products = [
    Product(name: 'Book', description: 'Very interesting book', price: 12.23),
    Product(
        name: 'Car', description: 'Desription of the car BMW', price: 1022.35),
    Product(
        name: 'Phone', description: 'Description for the IPhone', price: 345.76)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('ProductsListPage'),
            child: ProductsListPage(
              products: products,
              onTap: (Product product) {},
            ),
          ),
          ProductPage(product: products[1])
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // // Update the list of pages by setting _selectedBook to null
          // setState(() {
          //   _selectedBook = null;
          // });

          return true;
        },
      ),
    );
  }
}
