import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;

  Products([this.products = const [],this.deleteProduct]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Card(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(products[index]["image"]),
                  ),
                  Text(products[index]["title"]),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlatButton(
                          child: Text("Details"),
                          onPressed: () => Navigator.pushNamed(context, "/products/$index")
                                  .then((result) {
                                if (result) {
                                  deleteProduct(index);
                                }
                              })),
                    ],
                  )
                ],
              ),
            ),
        itemCount: products.length,
      ).build(context),
    );
  }
}
