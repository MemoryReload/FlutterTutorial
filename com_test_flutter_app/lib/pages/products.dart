import 'package:flutter/material.dart';

import '../products_manager.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  const ProductsPage({Key? key, required this.products, required this.deleteProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text("Choose"),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Manage Products"),
              onTap: () {
                Navigator.pushNamed(context, "/admin");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("EasyList"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // TODO: Implement favorite products view
            },
          )
        ],
      ),
      body: ProductsManager(products: products, deleteProduct: deleteProduct),
    );
  }
}
