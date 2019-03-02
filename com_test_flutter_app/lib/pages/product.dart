import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Details"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage(product["image"]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    product["title"],
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Oswald",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(product["price"].toString()),
                    Text("|"),
                    Text("Union Square, Los Angels"),
                  ],
                ),
                Text(product["description"]),
              ],
            )));
  }
}
