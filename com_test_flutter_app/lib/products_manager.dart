import 'package:flutter/material.dart';

import './products.dart';

class ProductsManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;

  ProductsManager(this.products, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Products(products, deleteProduct)
      ],
    );
  }
}
