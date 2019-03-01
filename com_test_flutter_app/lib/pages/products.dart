import 'package:flutter/material.dart';

import '../products_manager.dart';

class ProductsPage extends StatelessWidget {

  final List<Map<String, dynamic>> products;
  final Function deleteProduct;

  ProductsPage(this.products,this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
             AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
                title: Text("Manage Products"),
                onTap: () {
                  Navigator.pushNamed(context, "/admin");
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("EasyList"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite),onPressed: ()=>{
            
          },)
        ],
      ),
      body: ProductsManager(products,deleteProduct),
    );
  }
}
