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
            body: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Material(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image(
                      image: AssetImage(product["image"]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      product["title"],
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: "Oswald",
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Union Square, Los Angels",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$"+product["price"].toString(),
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(product["description"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2, //0.2倍行距
                            color: Colors.grey,
                            fontSize: 18)),
                    padding: EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            )));
  }
}
