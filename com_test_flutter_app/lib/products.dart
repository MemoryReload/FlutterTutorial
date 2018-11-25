import 'package:flutter/material.dart';

import './pages/product_page.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  Products([this.products = const []]);

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
                          onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              DetailPage(
                                                  products[index]["title"],
                                                  products[index]["image"])))
                                  .then((result) {
                                if (result) {
                                  products.removeAt(index);
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
