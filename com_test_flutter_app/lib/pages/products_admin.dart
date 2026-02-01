import 'package:flutter/material.dart';

import '../models/product.dart';
import './products_list.dart';
import './products_edit.dart';

class ProductManagePage extends StatelessWidget {
  final Function(Product) addProduct;

  const ProductManagePage(this.addProduct, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Choose"),
              ),
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text("Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/products");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Product Manage"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Create products",
                icon: Icon(Icons.create),
              ),
              Tab(
                text: "My products",
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductsEditPage(addProduct),
            const ProductsListPage(),
          ],
        ),
      ),
    );
  }
}
