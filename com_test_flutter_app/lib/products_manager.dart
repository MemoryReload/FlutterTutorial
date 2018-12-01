import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsManager(this.products, this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductControl(addProduct),
        Products(products, deleteProduct)
      ],
    );
  }
}
