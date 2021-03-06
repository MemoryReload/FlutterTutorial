import 'package:flutter/material.dart';

import './products_list.dart';
import './products_edit.dart';

class ProductManagePage extends StatelessWidget {
  final Function addProduct;

  ProductManagePage(this.addProduct);
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
                title: Text("Choose"),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text("Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/products");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Product Manage"),
          bottom: TabBar(
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
            ProductsListPage(),
          ],
        ),
      ),
    );
  }
}
