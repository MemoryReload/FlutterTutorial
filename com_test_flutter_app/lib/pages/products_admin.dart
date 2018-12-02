import 'package:flutter/material.dart';

import './products_list.dart';
import './products_edit.dart';

class ProductManagePage extends StatelessWidget {
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
                title: Text("Products"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Product Manage"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "My products",icon:Icon(Icons.list) ,),
              Tab(text: "Create products",icon: Icon(Icons.create),)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductsListPage(),
            ProductsEditPage()
          ],
        ),
      ),
    );
  }
}
