import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Card(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/food.jpg"),
                  ),
                  Text(products[index]),
                ],
              ),
            ),
        itemCount: products.length,
      ).build(context),
    );
  }
}
