import 'package:flutter/material.dart';

import './products.dart';
import './models/product.dart';

class ProductsManager extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  const ProductsManager({Key? key, required this.products, required this.deleteProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Add a header or other UI elements here if needed
        Expanded(
          child: Products(products: products, deleteProduct: deleteProduct),
        ),
      ],
    );
  }
}
